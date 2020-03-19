class CreateAvailableDates < ActiveRecord::Migration[5.2]
  def change
    create_table :available_dates do |t|
      t.references :host, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
