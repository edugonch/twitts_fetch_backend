require 'test_helper'

class TwittTest < ActiveSupport::TestCase

  def setup 
    @twitt = Twitt.new({
      twitter_id: 977915906927054849,
      text: "The latest The Signature Healthcare Daily! https://t.co/vnNy651vyT Thanks to @AAMCNews @AmJNurs #healthcare #askadoctor",
      hashtag: "healthcare",
      lang: "en",
      url: "https://twitter.com/SignatureHlth/status/977915906927054849",
      user_id: 224353426,
      user_name: "Signature Healthcare",
      profile_image_url: "http://pbs.twimg.com/profile_images/1189591493/Picture_63_normal.png"
  })
  end

  test "should be valid" do
    assert @twitt.valid?
  end

  test "twitter_id should be present" do
    @twitt.twitter_id = nil
    assert_not @twitt.valid?
  end

  test "text should be present" do
    @twitt.text = nil
    assert_not @twitt.valid?
  end

  test "hashtag should be present" do
    @twitt.hashtag = nil
    assert_not @twitt.valid?
  end

  test "lang should be present" do
    @twitt.lang = nil
    assert_not @twitt.valid?
  end

  test "url should be present" do
    @twitt.url = nil
    assert_not @twitt.valid?
  end

  test "user_id should be present" do
    @twitt.user_id = nil
    assert_not @twitt.valid?
  end

  test "user_name should be present" do
    @twitt.user_name = nil
    assert_not @twitt.valid?
  end

  test "profile_image_url should be present" do
    @twitt.profile_image_url = nil
    assert_not @twitt.valid?
  end
end
