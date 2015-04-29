class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :user, index: true
      t.references :task, index: true
      t.date :date

      t.timestamps null: false
    end
    add_foreign_key :bookings, :users
    add_foreign_key :bookings, :tasks
  end
end
