class CreateDeliveryDates < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_dates do |t|
      t.references :item
      t.references :shop
      t.timestamps
    end
  end
end
