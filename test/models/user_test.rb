require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "get existing user" do
    auth_hash={}
    auth_hash['provider']='fhs'
    auth_hash['uid']=3
    auth_hash['credentials']={}
    auth_hash['credentials']['token']='xxx'
    #auth_hash={"provider":"fhs","uid":3,"credentials":{"token":"XXX"}}

    u = User.find_or_create_with_omniauth(auth_hash)

    assert_equal u.id, user(:one).id
  end

  test "get existing user with new e-mail" do
    auth_hash={
      "provider":"fhs",
      "uid":3,
      "info":{
        "email":"different@fh-salzburg.ac.at",
      },
      "credentials":{"token":"XXX"}
    }

    u = User.find_or_create_with_omniauth(auth_hash)

    assert_equal u.id, user(:one).id
  end  
end
