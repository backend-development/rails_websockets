require 'test_helper'

class AdventuresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adventure = adventures(:one)
  end

  describe 'public actions' do
    test 'should get index' do
      get adventures_url
      assert_response :success
    end

    test 'should show adventure' do
      get adventure_url(@adventure)
      assert_response :success
    end
  end

  describe 'restricted actions as a guest' do
    test 'should not get new' do
      get new_adventure_url
      assert_redirected_to root_url
    end
  end

  describe 'restricted actions as logged in user' do
    setup do
      get auth_testing_path(id:users(:three).id)
      assert_equal flash[:notice], 'Logged in'
    end

    test 'should start' do
      post start_adventure_url(@adventure)
      assert_redirected_to adventure_stepstones_url(@adventure)
    end

    test 'should get new' do
      get new_adventure_url
      assert_response :success
    end

    test 'should create adventure' do
      assert_difference('Adventure.count') do
        post adventures_url, params: {
          adventure: {
            description: @adventure.description,
            title: @adventure.title
          }
        }
      end

      assert_redirected_to edit_adventure_url(Adventure.last)
    end
  end

  describe 'restricted actions as owner' do
    setup do
      get auth_testing_path(id: @adventure.owner)
    end

    test 'should order stepstones' do
      post sort_adventure_url(@adventure), params: {
        adventure: {
          stepstone_order: [
            stepstones(:three).id,
            stepstones(:one).id,
            stepstones(:two).id
          ]
        }
      }
      assert_response :success
    end

    test 'should get edit' do
      get edit_adventure_url(@adventure)
      assert_response :success
    end

    test 'should update adventure' do
      patch adventure_url(@adventure), params: {
        adventure: {
          description: @adventure.description,
          title: @adventure.title
        }
      }
      assert_redirected_to adventures_url
    end

    test 'should destroy adventure' do
      assert_difference('Adventure.count', -1) do
        delete adventure_url(@adventure)
      end

      assert_redirected_to adventures_url
    end
  end
end
