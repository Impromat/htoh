class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.integer :price
      t.string :address
      t.date :date
      t.string :city
      t.boolean :done, default: false
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
