class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions
  has_many :passed_tests
  has_many :users, through: :passed_tests

  def self.with_category(title)
    joins("JOIN categories ON tests.category_id = categories.id")
    .where("categories.title = ?", title).order(title: :desc).pluck(:title)
  end
end
