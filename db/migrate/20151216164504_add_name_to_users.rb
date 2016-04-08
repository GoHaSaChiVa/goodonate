class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :add_gender_to_users, :string
    add_column :users, :gender, :string
    add_column :users, :add_address_to_users, :string
    add_column :users, :address, :text
  end
end
