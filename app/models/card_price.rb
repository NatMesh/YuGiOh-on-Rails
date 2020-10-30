class CardPrice < ApplicationRecord
  belongs_to :card
  belongs_to :card_seller
end
