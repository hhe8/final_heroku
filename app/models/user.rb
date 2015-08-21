class User < ActiveRecord::Base

  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower

  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followee_follows, source: :followee

  has_many :message_receiveds, foreign_key: :receiver_id, class_name: "Message"
  has_many :message_sents, foreign_key: :sender_id, class_name: "Message"

  #searchs
  has_many :searchs, foreign_key: :searcher_id, class_name: "Search"

  validates :name, :email, presence: true, uniqueness: true
  validates :password, confirmation: true


  has_secure_password
end
