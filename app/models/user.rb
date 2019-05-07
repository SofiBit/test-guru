class User < ApplicationRecord

  def tests(level)
    Test.joins("JOIN passed_tests ON passed_tests.test_id = tests.id
       JOIN users ON passed_tests.user_id = users.id")
       .where("tests.level >= ? AND users.id >= ?", level, self.id)
  end
end
