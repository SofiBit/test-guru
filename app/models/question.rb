class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :quantity_answers

  def quantity_answers
    return if [1, 2, 3, 4].include? answers.count
    errors.add(:answers, "have a wrong quantity")
  end
end
