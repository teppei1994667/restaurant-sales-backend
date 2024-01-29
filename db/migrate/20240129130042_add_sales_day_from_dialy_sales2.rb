class AddSalesDayFromDialySales2 < ActiveRecord::Migration[7.0]
  def change
    add_column :dialy_sales, :sales_day, :datetime, null: false
  end
end
