class Customer < ApplicationRecord
  belongs_to :user
  validates :subject, length: { maximum: 50 }
end
