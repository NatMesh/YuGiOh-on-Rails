class MonsterCard < ApplicationRecord
  belongs_to :card
  has_many :link_markers
  has_many :markers, through: :link_markers

  validates :attack, :defense, :level, :link_value, :scale, numericality: {only_integer: true}
end
