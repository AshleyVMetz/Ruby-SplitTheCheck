class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :comments
  has_many :favorites
  has_many :votes, class_name: "VoteHistory"
  has_many :commented_restaurants, through: :comments, source: :restaurant




end
