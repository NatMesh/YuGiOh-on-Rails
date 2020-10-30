class Marker < ApplicationRecord
  validates :marker_direction, presence: true, uniqueness: true
  has_many :link_markers
  has_many :monster_cards, through: :link_markers
end
