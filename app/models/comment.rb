class Comment < ApplicationRecord
  self.table_name = "comment"
  belongs_to :user
  belongs_to :restaurant
end

