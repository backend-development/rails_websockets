require 'test_helper'

class AdventuresControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @adventure = adventures(:first_adventure)
    @alice = users(:alice)
  end

  test "adventure and user are set up" do
    assert_not_nil @adventure
    assert_not_nil @adventure.user
    assert @adventure.user == @alice
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:adventures)
  end

  test "no login: no new" do
    get :new
    assert_redirected_to adventures_path
  end

  test "should get new" do
    sign_in users(:alice)
    get :new
    assert_response :success
  end

  test "no login: no create" do
    post :create, adventure: { description: @adventure.description, title: @adventure.title, user_id: users(:alice).id }
    assert_redirected_to adventures_path
  end

  test "should create adventure" do
    sign_in users(:alice)
    assert_difference('Adventure.count') do
      post :create, adventure: { description: @adventure.description, title: @adventure.title, user_id: users(:alice).id }
    end

    assert_redirected_to adventure_path(assigns(:adventure))
  end

  test "should show adventure" do
    get :show, id: @adventure
    assert_response :success
  end

  test "no login: no edit" do
    get :edit, id: @adventure
    assert_redirected_to adventures_path
  end

  test "should get edit" do
    sign_in users(:alice)
    get :edit, id: @adventure
    assert_response :success
  end

  test "should update adventure" do
    put :update, id: @adventure, adventure: { description: @adventure.description, title: @adventure.title }
    assert_redirected_to adventures_path
  end

  test "should destroy adventure" do
    assert_difference('Adventure.count', -1) do
      delete :destroy, id: @adventure
    end

    assert_redirected_to adventures_path
  end
end
