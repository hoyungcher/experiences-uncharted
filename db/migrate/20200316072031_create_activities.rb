class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :location
      t.integer :price_per_day
      t.text :description
      t.references :host, foreign_key: true

      t.timestamps
    end
  end
end
