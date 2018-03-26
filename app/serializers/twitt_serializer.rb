# @attr [long] twitter_id
# @attr [string] text
# @attr [string] hashtag
# @attr [string] lang
# @attr [string] url
# @attr [long] user_id
# @attr [string] user_name
# @attr [string] profile_image_url
class TwittSerializer < ActiveModel::Serializer
  include ActionView::Helpers::DateHelper

  attributes :twitter_id, :text, :hashtag, :lang, :url, :user_id, :user_name, :profile_image_url, :created_at, :human_date

  def human_date
    time_ago_in_words(object.created_at, include_seconds: true)
  end
end
