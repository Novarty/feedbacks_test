class Feedback < ApplicationRecord
  validates :name, :email, :body, presence: true
end
