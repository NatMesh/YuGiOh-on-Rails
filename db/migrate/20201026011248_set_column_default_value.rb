class SetColumnDefaultValue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :monster_cards, :attack, 0
    change_column_default :monster_cards, :defense, 0
    change_column_default :monster_cards, :level, 0
    change_column_default :monster_cards, :link_value, 0
    change_column_default :monster_cards, :scale, 0
  end
end
