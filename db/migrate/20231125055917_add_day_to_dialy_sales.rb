class AddDayToDialySales < ActiveRecord::Migration[7.0]
  def change
    add_column :dialy_sales, :day, :string, null: false
  end
end
