class Business < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  VALID_URL = /\A#{URI::regexp(%w(http https))}\z/
  validates :url, length: {maximum: 255},
                  format: {with: VALID_URL}
end
