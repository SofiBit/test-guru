class Test < ApplicationRecord
  def self.with_category(title)
    tests = Test.joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.title = ?", title)
    tests.pluck(:title)
  end
end
