class Favorite < ApplicationRecord
   self.table_name = "favorite"  
  belongs_to :user
  belongs_to :restaurant
end

