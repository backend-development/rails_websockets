require 'test_helper'

class StepstonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adventure = adventures(:one)
    @stepstone = stepstones(:one)
  end

  describe 'public actions' do
    test 'should get index' do
      get adventure_stepstones_url(@adventure)
      assert_response :success
    end
  end

  describe 'restricted actions as a guest' do
    test 'should not get new' do
      get new_adventure_stepstone_url(@adventure)
      assert_redirected_to root_url
    end
  end

  describe 'restricted actions as logged in user' do
    setup do
      get auth_testing_path
    end

    test 'should get new' do
      get new_adventure_stepstone_url(@adventure)
      assert_response :success
    end

    test 'should create stepstone' do
      assert_difference('Stepstone.count') do
        post adventure_stepstones_url(@adventure), params: { stepstone: { description: @stepstone.description } }
      end

      assert_redirected_to adventure_stepstones_url(@adventure)
    end

    test 'should show stepstone' do
      get adventure_stepstone_url(@adventure, @stepstone)
      assert_response :success
    end

    test 'should get edit' do
      get edit_adventure_stepstone_url(@adventure, @stepstone)
      assert_response :success
    end

    test 'should update stepstone' do
      patch adventure_stepstone_url(@adventure, @stepstone),
            params: { stepstone: { description: @stepstone.description } }
      assert_redirected_to adventure_stepstone_url(@adventure, @stepstone)
    end

    test 'should destroy stepstone' do
      assert_difference('Stepstone.count', -1) do
        delete adventure_stepstone_url(@adventure, @stepstone)
      end

      assert_redirected_to adventure_stepstones_url(@adventure)
    end
  end
end
