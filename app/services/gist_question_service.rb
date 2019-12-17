
class GistQuestionService
  attr_reader :question, :test, :client

  def initialize(question, client: setup_octokit_client)
    @question = question
    @test = @question.test.title
    @client = client
  end

  def run
    client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: I18n.t('services.gists.description', test: test),
      files: { "test-guru-question.txt" => { content: gist_content } },
      public: true
    }
  end

  def gist_content
    [question.body, *question.answers.pluck(:body)].join("\n")
  end

  def setup_octokit_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
end

class ResultGist
  delegate :html_url, to: :@gist

  def initialize(gist)
    @gist = gist
  end

  def success?
    return false unless @gist.present?

    html_url.present?
  end
end
