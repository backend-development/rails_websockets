require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create new user' do
    begin
      new_uid = Random.rand(1000) 
    end until User.where(uid: new_uid).count.zero?

    auth_hash = {
      'provider' => 'fhs',
      'uid' => new_uid,
      'credentials' => { 'token' => 'XXX' }
    }

    assert_difference('User.count') do
      u = User.find_or_create_with_omniauth(auth_hash)
      assert_equal u.token, 'XXX'
    end
  end

  test 'get existing user' do
    auth_hash = {
      'provider' => 'fhs',
      'uid' => 3,
      'credentials' => { 'token' => 'XXX' }
    }

    assert_no_difference('User.count') do
      u = User.find_or_create_with_omniauth(auth_hash)
      assert_equal u.id, users(:one).id
      assert_equal u.email, users(:one).email
      assert_equal u.token, 'XXX'
    end
  end

  test 'get existing user with new e-mail' do
    auth_hash = {
      'provider' => 'fhs',
      'uid' => 3,
      'info' => {
        'email' => 'different@fh-salzburg.ac.at'
      },
      'credentials' => { 'token' => 'XXX' }
    }

    assert_no_difference('User.count') do
      u = User.find_or_create_with_omniauth(auth_hash)
      assert_equal u.id, users(:one).id
      assert_equal u.email, 'different@fh-salzburg.ac.at'
    end
  end
end
