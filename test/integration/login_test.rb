require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
    @other = users(:two)
  end
  
  test "login as correct user" do
    get root_path
    post root_path, params: { session: { email:    @user.email,
                                         password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", logout_path
    # test other account page
    get user_path(@other)
    assert_redirected_to @user
    # test logout
    delete logout_path
    get root_path
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", signup_path
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
  
  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    assert_not_empty cookies['remember_token']
  end
  
  test "login without remembering" do
    log_in_as(@user, remember_me: '1')
    delete logout_path
    log_in_as(@user, remember_me: '0')
    assert_empty cookies['user_id']
    assert_empty cookies['remember_token']
  end
end
