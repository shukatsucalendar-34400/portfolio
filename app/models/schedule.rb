class Schedule < ApplicationRecord
  belongs_to :user
  belongs_to :business, optional: true
  validates :name, presence: true, length: {maximum: 30}
  validates :user_id, presence: true
  validates :first_date, presence: true

  validate  :last_date_not_before_first_date
  validate  :user_has_business
  
  private
    def last_date_not_before_first_date
      errors.add(:last_date, "は初日以降に設定してください.") if !last_date.nil? && last_date < first_date
    end

    def user_has_business
      if !:business_id && (business = Business.find(:business_id)) && (business.user_id != :user_id) 
        errors.add(:business_id, "企業とユーザーが一致しません")
      end
    end
end
