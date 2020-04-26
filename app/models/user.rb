class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def get_comment
    Comment.where(user_id:self.id)
  end

  def get_favorite
    Favorite.where(user_id:self.id)      
  end

  def get_voteHistory
    VoteHistory.where(user_id:self.id)      
  end


end
