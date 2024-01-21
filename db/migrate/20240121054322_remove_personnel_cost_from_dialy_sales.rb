class RemovePersonnelCostFromDialySales < ActiveRecord::Migration[7.0]
  def change
    remove_column :dialy_sales, :lunch_personnel_cost, :integer
    remove_column :dialy_sales, :dinner_personnel_cost, :integer
  end
end
