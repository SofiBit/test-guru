class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if answer_correct?(answer_ids)

    save!
  end

  def number_question
    test.questions.order(:id).where('id <= ?', current_question.id).count
  end

  def success_rate
    correct_questions.to_f / test.questions.count * 100
  end

  def successful?
    success_rate > 85
  end

  private

  def before_validation_next_question
    if new_record? && test.present?
      self.current_question = test.questions.first
    else
      self.current_question = next_question
    end
  end

  def answer_correct?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.right
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
