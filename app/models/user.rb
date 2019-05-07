class User < ApplicationRecord

  def tests(level)
    Test.joins("JOIN passed_tests ON passed_tests.test_id = tests.id")
       .where("tests.level = ? AND passed_tests.user_id = ?", level, id)
  end
end
