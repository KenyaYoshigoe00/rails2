class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  
  has_one_attached :room_icon
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true, numericality: {greater_than_or_equal_to: 0}
  validates :address, presence: true
  
end
