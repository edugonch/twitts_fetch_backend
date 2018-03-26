require 'test_helper'

class Api::V1::TwittsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    DatabaseCleaner.clean
    @service = TwitterFetchService.new
    VCR.use_cassette("fetch_twitts") do
        @service.fetch_last
    end
    
    User.create(name: "Test User", email: "test@test.com", password: 'testpassword', password_confirmation: 'testpassword')

    headers = { "CONTENT_TYPE" => "application/json"}
    post "/authenticate", params: '{ "email": "test@test.com", "password": "testpassword" }', headers: headers
    json_response = JSON.parse(response.body)

    @token = json_response["auth_token"]
    
  end

  test "should return last twitts to identifyed user with correct hashtags" do 
    
    headers = { "CONTENT_TYPE" => "application/json",  "Authorization" => @token}
    get "/api/v1/twitts/healthcare", headers: headers

    json_response = JSON.parse(response.body)

    assert_equal 10, json_response["data"].count
  end

  test "should return error with undentified user" do 
    
    headers = { "CONTENT_TYPE" => "application/json"}
    get "/api/v1/twitts/healthcare", headers: headers

    json_response = JSON.parse(response.body)

    assert_equal "Not Authorized", json_response["error"]
  end
  
end
