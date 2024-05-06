class AddStoreIdToDialySales < ActiveRecord::Migration[7.0]
  def change
    add_reference :dialy_sales, :store, null: false , foreign_key: true
  end
end
