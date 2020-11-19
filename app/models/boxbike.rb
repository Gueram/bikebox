class Boxbike < ApplicationRecord
  belongs_to :user
  has_many :contracts, dependent: :destroy
  validates :address, :capacity, :price, presence: true
  validates :capacity, inclusion: { in:(1..5) }, numericality: true
  validates :capacity, :price, numericality: { greater_than: 0 }

  def spots_left
    sum = 0
    contracts.each do |contract|
      sum += contract.number_bikes
    end
    return capacity - sum
  end

end
