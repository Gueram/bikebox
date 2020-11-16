class Boxbike < ApplicationRecord
  belongs_to :user
  has_many :contracts, dependent: :destroy
  validates :address, :capacity, :price, presence: true
  validates :capacity, inclusion: { in:(1..5) }, numericality: true
  validates :capacity, :price, numericality: { greater_than: 0 }
end
