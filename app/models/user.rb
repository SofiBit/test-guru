class User < ApplicationRecord
  has_many :author_tests, class_name: 'Test', dependent: :nullify
  has_many :test_passages
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :first_name, :last_name, presence: true

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable

  def tests_with_level(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    is_a?(Admin)
  end
end
