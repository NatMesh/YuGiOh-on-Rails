class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_type
      t.text :description
      t.string :race
      t.string :archetype
      t.string :card_image
      t.string :card_image_small

      t.timestamps
    end
  end
end
