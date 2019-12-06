module QuestionsHelper

  def question_header(question)
    title = question.test.title
    return t('.edit_question', test_title: title ) if question.persisted?

    t('.new_question', test_title: title )
  end
end
