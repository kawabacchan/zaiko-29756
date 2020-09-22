class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.integer :category, null: false
      t.string :code, null: false
      t.string :name, null: false
      t.integer :stock, null: false
      t.integer :monthly_sales, null: false
      t.integer :creation_days, null: false
      t.timestamps
    end
  end
end