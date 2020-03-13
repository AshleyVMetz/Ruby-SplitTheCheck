class AddCityStateToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :city, :string
    add_column :restaurants, :state, :string
  end
end
