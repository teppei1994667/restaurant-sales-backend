class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false, limit: 50
      t.string :address, null: false, limit: 100
      t.string :phone_number, null: false, limit: 15
      t.integer :floor_space
      t.integer :seating_capacity

      t.timestamps
    end
  end
end
