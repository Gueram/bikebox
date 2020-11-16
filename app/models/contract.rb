class Contract < ApplicationRecord
  belongs_to :user
  belongs_to :boxbike
  validates :start_date, :end_date, presence: true
  validates :number_bikes, numericality: true
  validates :number_bikes, numericality: { greater_than: 0 }
end
