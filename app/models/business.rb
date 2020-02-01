class Business < ApplicationRecord
  belongs_to :user
  has_many :schedules, dependent: :destroy
  attr_accessor :submit_url
  validates :name, presence: true, length: {maximum: 100}
  validates :user_id, presence: true
  validates :web_site, length: {maximum: 255}
  validates :my_page, length: {maximum: 255}

  private

end
