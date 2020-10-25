class CreateMonsterCards < ActiveRecord::Migration[6.0]
  def change
    create_table :monster_cards do |t|
      t.integer :attack
      t.integer :defense
      t.integer :level
      t.string :attribute
      t.integer :link_value
      t.integer :scale
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
