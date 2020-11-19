class Boxbike < ApplicationRecord
  belongs_to :user
  has_many :contracts, dependent: :destroy
  validates :address, :capacity, :price, presence: true
  validates :capacity, inclusion: { in:(1..5) }, numericality: true
  validates :capacity, :price, numericality: { greater_than: 0 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
