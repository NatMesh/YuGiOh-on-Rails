class CreateMarkers < ActiveRecord::Migration[6.0]
  def change
    create_table :markers do |t|
      t.string :marker_direction

      t.timestamps
    end
  end
end
