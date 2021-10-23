class Tweet < ApplicationRecord
  validates :message, presence: true

  belongs_to :user
  has_many :likes
  has_many :like_users, through: :likes, source: :user
end
