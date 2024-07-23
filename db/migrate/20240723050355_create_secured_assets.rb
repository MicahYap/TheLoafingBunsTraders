class CreateSecuredAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :secured_assets do |t|
      t.string :trader_number
      t.integer :carrots

      t.timestamps
    end
  end
end
