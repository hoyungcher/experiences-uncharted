class AddAndUpdateSchemaToActivities < ActiveRecord::Migration[5.2]
  def change
    rename_column :activities, :location, :city
    rename_column :activities, :price_per_day, :price_per_person
    add_column :activities, :max_group_size, :integer
    add_column :activities, :duration, :integer
    add_column :activities, :address, :string

  end
end
