class CardSeller < ApplicationRecord
  has_many :card_prices
  has_many :cards, through: :card_prices
  validates :seller_name, presence: true, uniqueness: true

end
