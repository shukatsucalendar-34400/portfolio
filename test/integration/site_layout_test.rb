require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "root layout" do
    get root_path
    assert_template 'sessions/new'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", signup_path
  end
end
