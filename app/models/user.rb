require 'digest/sha1'

class User < ApplicationRecord

  has_many :author_tests, class_name: 'Test', dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP,
    message: "format: @example.com" }

  has_secure_password

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
