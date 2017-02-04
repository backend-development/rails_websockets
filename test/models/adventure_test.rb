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

  describe 'stepstones' do
    test 'stepstone sortorder is automatically set on creation. zero-based!' do
      adventure = Adventure.create!(title: 'something')
      stepstone = adventure.stepstones.create(description: 'do something specific first')
      assert_equal 0, stepstone.sortorder
      stepstone = adventure.stepstones.create(description: 'and another thing')
      assert_equal 1, stepstone.sortorder
      stepstone = adventure.stepstones.create(description: 'and a third thing')
      assert_equal 2, stepstone.sortorder
    end
  end
end
