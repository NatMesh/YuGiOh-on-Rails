class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :monster_cards, :attribute, :monster_attribute
  end
end
