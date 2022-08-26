class Customer < ApplicationRecord
  belongs_to :user
  validates :subject, length: { maximum: 50 }, presence: true, allow_nil: true
  validates :content, presence: true, allow_nil: true
end
