class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :category
      t.integer :quantity
      t.string :organization

      t.timestamps null: false
    end
  end
end
