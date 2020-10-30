class CreateCardSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :card_sellers do |t|
      t.string :seller_name

      t.timestamps
    end
  end
end
