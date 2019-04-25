class PassedTest < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :test, optional: true
end
