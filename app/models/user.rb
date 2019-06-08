class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, presence: true

  def tests_with_level(level)
    tests.where(level: level)
  end
end
