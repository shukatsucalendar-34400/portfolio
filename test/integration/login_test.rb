require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
  end
  
  test "login as correct user" do
    get root_path
    post root_path, params: { session: { email:    @user.email,
                                         password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
  end
  
  test "login invalid information" do
    get root_path
    post root_path, params: { session: { email:    @user.email,
                                         password: 'invalid-pass' } }
    assert_template root_path
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end
  
end
