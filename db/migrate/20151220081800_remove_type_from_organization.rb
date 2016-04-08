class RemoveTypeFromOrganization < ActiveRecord::Migration
  def change
    remove_column :organizations, :type, :string
  end
end
