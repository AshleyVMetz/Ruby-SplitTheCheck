class Restaurant < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
  
  def split
    
    VoteHistory.where(restaurant_id:self.id, split:true).count
  end

  def nosplit
    VoteHistory.where(restaurant_id:self.id, split:false).count

  end

  def add_comment(user_id, comment)
    
    Comment.create(restaurant_id:self.id, user_id:user_id, comment:comment).save
  end

  def add_favorite(user_id)

    Favorite.create(restaurant_id:self.id, user_id:user_id).save
  end

    def add_vote(user_id, split)

    VoteHistory.create(restaurant_id:self.id, user_id:user_id, split:split).save
  end


end
