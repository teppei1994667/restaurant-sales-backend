class AddPersonnelCostToDialySales < ActiveRecord::Migration[7.0]
  def change
    add_column :dialy_sales, :personnel_cost, :integer, null: false
  end
end
