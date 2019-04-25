class Test < ApplicationRecord
  belongs_to :сategory
  has_many :passed_tests
  has_many :users, through: :passed_tests
  has_many :questions

  scope :category_name, ->(category) { joins(:category).where(categories: { title: category }) }
  scope :sort_title, -> { order(title: :desc) }

  def self.with_category(category)
    category_name(category).sort_title.pluck(:title)
  end
end
