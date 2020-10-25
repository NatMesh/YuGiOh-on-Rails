class MonsterCard < ApplicationRecord
  belongs_to :card

  validates :attack, :defense, :level, :link_value, :scale, numericality: {only_integer: true}
end
