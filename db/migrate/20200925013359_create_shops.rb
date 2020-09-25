class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :company_name, null: false
      t.string :shop_name, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_days, null: false
      t.timestamps
    end
  end
end
