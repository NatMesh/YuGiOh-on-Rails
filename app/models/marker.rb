class Marker < ApplicationRecord
  has_many :link_markers
  has_many :monster_cards, through: :link_markers
  validates :marker_direction, presence: true, uniqueness: true
end
