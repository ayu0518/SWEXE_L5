class User < ApplicationRecord
  validates :uid, :pass, presence: true
  validates :uid, uniqueness: true

  has_many :tweets
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet
end
