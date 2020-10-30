class Card < ApplicationRecord
  has_many :monster_cards
  validates :name, :card_type, :description, :race, :card_image, :card_image_small, presence: true
  validates :name, uniqueness: true

  def markers_list
    monster_cards.first.markers.map(&:marker_direction).join(", ")
  end
end