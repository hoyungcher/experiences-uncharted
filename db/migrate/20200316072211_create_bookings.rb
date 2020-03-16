class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :activity, foreign_key: true
      t.references :user, foreign_key: true
      t.references :host, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
