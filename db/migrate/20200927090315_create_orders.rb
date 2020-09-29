class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :sales_numbers, null: false
      t.references :item, foreign_key: true
      t.references :shop, foreign_key: true
      t.timestamps
    end
  end
end
