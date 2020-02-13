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