module QuestionsHelper
  MAX_SYMBOLS = 25

  def question_header(question)
    title = question.test.title
    return t('.edit_question', test_title: title ) if question.persisted?

    t('.new_question', test_title: title )
  end

  def link_question(question)
    body = question.body.split('').reject.each_with_index do |symbol, index|
      index > MAX_SYMBOLS - 1
    end.join
    link_to "#{result_body(body, question)}", admin_question_path(question)
  end

  def result_body(body, question)
    return "#{body}.." if body.length < question.body.length

    body
  end
end
