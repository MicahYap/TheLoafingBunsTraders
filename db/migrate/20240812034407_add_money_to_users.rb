class AddMoneyToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :money, :decimal, default: 5000, precision: 10, scale: 2
  end
end
