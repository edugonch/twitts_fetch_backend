require 'twitter'

class TwitterFetchService

    def initialize
        @tags = Rails.application.secrets.tags.split(',')
        @client = Twitter::REST::Client.new do |config|
            config.consumer_key        = Rails.application.secrets.twitter[:consumer_key]
            config.consumer_secret     = Rails.application.secrets.twitter[:consumer_secret]
            config.access_token        = Rails.application.secrets.twitter[:access_token]
            config.access_token_secret = Rails.application.secrets.twitter[:access_token_secret]
        end
    end

    def fetch_last
        twitts = []
        @tags.each do |tag|
            twitts << get_twitts(@client.search(tag, lang: "en").take(10), tag)
        end
        Twitt.create(twitts.flatten.shuffle)
    end

    private

    def get_twitts(twitts, tag)
        ids = twitts.map{|t| t.id}
        existing_twitts = Twitt.where("twitter_id in (?)", ids).pluck(:twitter_id)
        new_twitts = twitts.select{|t| existing_twitts.exclude?(t.id) }

        fromated_twitts = new_twitts.map do |t|
            {
                twitter_id: t.id,
                text: t.text,
                hashtag: tag,
                lang: t.lang,
                url: t.url.to_s,
                user_id: t.user.id,
                user_name: t.user.name,
                profile_image_url: t.user.profile_image_url.to_s 
            }
        end
        fromated_twitts
    end
end