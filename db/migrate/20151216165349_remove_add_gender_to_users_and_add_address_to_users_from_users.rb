class RemoveAddGenderToUsersAndAddAddressToUsersFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :add_gender_to_users, :string
    remove_column :users, :add_address_to_users, :text
  end
end
