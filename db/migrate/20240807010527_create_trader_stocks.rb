class CreateTraderStocks < ActiveRecord::Migration[7.2]
  def change
    create_table :trader_stocks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :stock, null: false, foreign_key: true

      t.timestamps
    end
  end
end
