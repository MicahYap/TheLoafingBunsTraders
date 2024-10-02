class AddBalanceToTransactions < ActiveRecord::Migration[7.2]
  def change
    add_column :transactions, :balance, :decimal
  end
end
