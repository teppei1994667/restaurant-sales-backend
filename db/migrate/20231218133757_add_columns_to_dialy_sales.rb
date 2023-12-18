class AddColumnsToDialySales < ActiveRecord::Migration[7.0]
  def change
    add_column :dialy_sales, :lunch_visitor, :integer, null: false
    add_column :dialy_sales, :dinner_visitor, :integer, null: false
    add_column :dialy_sales, :lunch_personnel_cost, :integer, null: false
    add_column :dialy_sales, :dinner_personnel_cost, :integer, null: false
    add_column :dialy_sales, :purchase, :integer, null: false
  end
end
