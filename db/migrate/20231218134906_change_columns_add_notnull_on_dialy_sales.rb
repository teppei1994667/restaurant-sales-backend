class ChangeColumnsAddNotnullOnDialySales < ActiveRecord::Migration[7.0]
  def change
    change_column_null :dialy_sales, :lunch_sales, false
    change_column_null :dialy_sales, :dinner_sales, false
  end
end
