module QuestionsHelper
  MAX_SYMBOLS = 25

  def question_header(question)
    title = question.test.title
    return t('.edit_question', test_title: title ) if question.persisted?

    t('.new_question', test_title: title )
  end

  def link_question(question)
    body = question.body.truncate(MAX_SYMBOLS)
    link_to body, admin_question_path(question)
  end
end
