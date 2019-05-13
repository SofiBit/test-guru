class Answer < ApplicationRecord
  belongs_to :question

  scope :right, -> { where(correct: true) }

  validates :body, presence: true
  validate :quantity_answers

  def quantity_answers
    return if question.answers.count <= 4 || question.answers.include?(self)
    errors.add(:question, "is already filled")
  end
end
