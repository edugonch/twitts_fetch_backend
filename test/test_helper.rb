ENV['RAILS_ENV'] ||= 'test'

require "minitest-vcr"
require 'webmock/minitest'
require 'database_cleaner'

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

VCR.configure do |c|
  c.cassette_library_dir = 'test/cassettes'
  c.hook_into :webmock
end

MinitestVcr::Spec.configure!

DatabaseCleaner.strategy = :truncation

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
