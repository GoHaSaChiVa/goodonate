class AddContactNumberToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :contact_number, :string
  end
end
