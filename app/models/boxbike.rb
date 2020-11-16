class Boxbike < ApplicationRecord
  belongs_to :user
  has_many :contracts
  validates :address, presence: true
end
