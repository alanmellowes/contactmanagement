require "test_helper"

class InvalidNewUserTest < ActionDispatch::IntegrationTest
  fixtures :all

  test 'try to create a new user' do 
  	@user = users(:one)
  	get '/users/new'
  	assert_response :success
  
  		
  end
end
