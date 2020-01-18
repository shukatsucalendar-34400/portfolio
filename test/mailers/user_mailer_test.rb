require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = users(:one)
  end

  test "account_activation" do
    mail = UserMailer.account_activation(@user)
    @user.activation_token = User.new_token
    mail = UserMailer.account_activation(@user)
    assert_equal "アカウントの有効化", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
  end

  test "password_reset" do
  end

end
