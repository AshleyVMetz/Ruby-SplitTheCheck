require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    @restaurant = restaurants(:one)
     
 end

  test 'should get summary'
   
  end
