class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: true
  validate :quantity_answers, on: :create

  def quantity_answers
    return if question.answers.count < 4
    errors.add(:question, "is already filled")
  end
end
