require 'test_helper'

class AdventureTest < ActiveSupport::TestCase
  setup do
    @adventure = adventures(:one)
    @user = users(:one)
  end

  describe 'statuses of user in this adventure: ' do
    test 'unrelated user has empty statuses' do
      u = User.create!
      assert_empty @adventure.statuses_of(u)
    end

    test 'correct status map' do
      assert_equal ['finished', 'working', 'not_started'], @adventure.statuses_of(@user)
    end
  end
end
