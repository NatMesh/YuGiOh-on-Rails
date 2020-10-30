class CreateCardPrices < ActiveRecord::Migration[6.0]
  def change
    create_table :card_prices do |t|
      t.references :card, null: false, foreign_key: true
      t.references :card_seller, null: false, foreign_key: true
      t.string :price

      t.timestamps
    end
  end
end
