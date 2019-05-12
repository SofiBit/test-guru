class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :passed_tests
  has_many :users, through: :passed_tests, dependent: :destroy

  scope :easy_level, -> { where(level: 0..1) }
  scope :average_level, -> { where(level: 2..4) }
  scope :difficult_level, -> { where(level: 5..Float::INFINITY) }
  scope :category_title, ->(title) { joins(:category).where(categories: { title: title }) }
  scope :sort_title, -> { order(title: :desc) }

  def self.with_category(title)
    category_title(title).sort_title.pluck(:title)
  end
end
