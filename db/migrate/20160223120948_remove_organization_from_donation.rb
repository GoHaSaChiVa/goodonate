class RemoveOrganizationFromDonation < ActiveRecord::Migration
  def change
    remove_column :donations, :organization, :string
  end
end
