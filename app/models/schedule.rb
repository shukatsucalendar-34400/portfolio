class Schedule < ApplicationRecord
  belongs_to :business, optional: true
  validates :name, presence: true, length: {maximum: 30}
  validates :first_date, presence: true
  validate  :last_date_not_before_first_date
  
  private
    def last_date_not_before_first_date
      errors.add(:last_date, "は初日以降に設定してください.") if !last_date.nil? && last_date < first_date
    end
end
