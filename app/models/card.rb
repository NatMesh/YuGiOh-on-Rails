class Card < ApplicationRecord
  has_many :monster_cards
  has_many :card_prices
  has_many :card_sellers, through: :card_prices

  validates :name, :card_type, :description, :race, :card_image, :card_image_small, presence: true
  validates :name, uniqueness: true

  paginates_per 20

  def markers_list
    monster_cards.first.markers.map(&:marker_direction).join(", ")
  end
end