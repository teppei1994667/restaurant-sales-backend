class CreateDialySales < ActiveRecord::Migration[7.0]
  def change
    create_table :dialy_sales do |t|
      t.date :day, presence: true
      t.integer :lunch_sales
      t.integer :dinner_sales

      t.timestamps
    end
  end
end
