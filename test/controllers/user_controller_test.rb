require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:user_001)
    post user_session_url
    @restaurant = restaurants(:one)
     
 end

  test 'should get summary' do
    get users_show_path(users(:user_001))
    assert_response :success
   
  end

end
