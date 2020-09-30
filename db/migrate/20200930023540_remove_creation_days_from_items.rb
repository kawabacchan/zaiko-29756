class RemoveCreationDaysFromItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :items, :creation_days, :integer
  end
end
