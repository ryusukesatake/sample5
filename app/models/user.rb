class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

        has_many :tweets, dependent: :destroy

        has_many :messages, dependent: :destroy
        has_many :entries, dependent: :destroy
        
        validates :name, presence: true 
        validates :profile, length: { maximum: 200 } 

        has_many :likes, dependent: :destroy
        has_many :liked_tweets, through: :likes, source: :tweet

        has_many :comments, dependent: :destroy

        mount_uploader :image, ImageUploader

        def already_liked?(tweet)
          self.likes.exists?(tweet_id: tweet.id)
        end
        has_many :comments, dependent: :destroy
end
