class RemoveSalesDayFromDialySales < ActiveRecord::Migration[7.0]
  def change
    remove_column :dialy_sales, :sales_day, :date
  end
end
