class RemoveLocationFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :location, :string
  end
end
