class Test < ApplicationRecord

  def self.with_category(category_title)
    tests_title = []
    Test.joins(:category).order(title: :desc).where(categories: {title: category_title}).each do |test|
      tests_title << test.title
    end
    tests_title
  end
end
