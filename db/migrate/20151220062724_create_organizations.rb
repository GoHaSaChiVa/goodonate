class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :type
      t.date :year
      t.text :description

      t.timestamps null: false
    end
  end
end
