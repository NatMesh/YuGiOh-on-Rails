class CreateLinkMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :link_markers do |t|
      t.references :monster_card, null: false, foreign_key: true
      t.references :marker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
