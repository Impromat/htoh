class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :competences, :string
    add_column :users, :phone, :string
    add_column :users, :address, :string
    add_column :users, :marks, :integer
  end
end
