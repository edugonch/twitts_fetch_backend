require 'test_helper'

class TwitterFetchServiceTest < ActiveSupport::TestCase
  
    def setup
        DatabaseCleaner.clean
        @service = TwitterFetchService.new
        VCR.use_cassette("fetch_twitts") do
            @service.fetch_last
        end
    end

    test "should be 30 twitts saved" do
        assert_equal 30, Twitt.count
    end

    test "should be 10 twitts saved for each tag" do
        Rails.application.secrets.tags.split(',').each do |tag|
            assert_equal 10, Twitt.where(hashtag: tag).count
        end
    end
end
