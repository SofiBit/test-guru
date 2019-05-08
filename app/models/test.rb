class Test < ApplicationRecord

  def self.with_category(title)
    joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.title = ?", title).order(title: :desc).pluck(:title)
  end
end
