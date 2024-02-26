class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :check_in, presence: true
  validates :check_out, presence: true
  validate :check_out_later_than_check_in
  validate :check_in_after_today
  validates :people, presence: true, numericality: {greater_than_or_equal_to: 1}
  
  def check_out_later_than_check_in
    if check_out.present? && check_in.present? && check_out < check_in
      errors.add(:check_out, "はチェックイン日以降の日付を選択して下さい")
    end
  end
  
  def check_in_after_today
    if check_in.present? && check_in < Date.today
      errors.add(:check_in, "は本日以降の日付を選択して下さい")
    end
  end
end
