class RemoveDayFromDialySales < ActiveRecord::Migration[7.0]
  def change
    remove_column :dialy_sales, :day, :date
  end
end
