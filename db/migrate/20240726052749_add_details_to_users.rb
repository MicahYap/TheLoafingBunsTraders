class AddDetailsToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :birthday, :date
    add_column :users, :gender, :string
    add_column :users, :address, :string
    add_column :users, :cp_number, :string
  end
end
