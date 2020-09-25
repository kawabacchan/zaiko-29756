class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :company_name
      t.string :shop_name
      t.integer :prefecture_id
      t.integer :delivery_days
      t.timestamps
    end
  end
end
