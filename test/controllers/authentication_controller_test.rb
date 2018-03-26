require 'test_helper'

class AuthenticationControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    DatabaseCleaner.clean
    
    User.create(name: "Test User", email: "test@test.com", password: 'testpassword', password_confirmation: 'testpassword')
  end

  test "should get a token with a valid user" do 
    headers = { "CONTENT_TYPE" => "application/json" }
    post "/authenticate", params: '{ "email": "test@test.com", "password": "testpassword" }', headers: headers
    json_response = JSON.parse(response.body)
    assert_not_empty json_response["auth_token"]
  end
  
end
