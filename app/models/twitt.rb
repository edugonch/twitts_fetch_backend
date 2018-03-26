class Twitt < ApplicationRecord
    validates :twitter_id, presence: true
    validates :text, presence: true
    validates :hashtag, presence: true
    validates :lang, presence: true
    validates :url, presence: true
    validates :user_id, presence: true
    validates :user_name, presence: true
    validates :profile_image_url, presence: true
end
