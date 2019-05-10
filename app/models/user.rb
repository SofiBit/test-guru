class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test'
  has_many :passed_tests
  has_many :tests, through: :passed_tests

  def tests(level)
    Test.joins("JOIN passed_tests ON passed_tests.test_id = tests.id")
       .where("tests.level = ? AND passed_tests.user_id = ?", level, id)
  end
end
