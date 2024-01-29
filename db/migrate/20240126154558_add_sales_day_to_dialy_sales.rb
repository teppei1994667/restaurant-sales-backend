class AddSalesDayToDialySales < ActiveRecord::Migration[7.0]
  def change
    add_column :dialy_sales, :sales_day, :date, null: false
  end
end
