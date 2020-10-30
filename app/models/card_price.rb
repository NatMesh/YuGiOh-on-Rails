class CardPrice < ApplicationRecord
  belongs_to :card
  belongs_to :card_seller
  validates :price, presence: true
end
