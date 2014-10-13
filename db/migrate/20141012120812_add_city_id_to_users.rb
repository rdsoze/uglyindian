class AddCityIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city_id, :integer
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
  end
end
