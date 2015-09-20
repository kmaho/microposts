class AddLocationToUser < ActiveRecord::Migration
  def change
    add_column :users, :location, :string
    add_column :users, :introduction, :string
  end
end
