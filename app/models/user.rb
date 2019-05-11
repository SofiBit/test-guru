class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', dependent: :nullify
  has_many :passed_tests, dependent: :destroy
  has_many :tests, through: :passed_tests

  def tests_with_level(level)
    tests.where(level: level)
  end
end
