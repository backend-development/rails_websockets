require 'test_helper'

class StepsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  setup do
    @adventure = Adventure.create!(:title => "write a rails application", :description => "it's complicated")
    @step = Step.create!(:title => "run rails new", :description => "let rails do the hard work", :adventure_id => @adventure.id)
  end

  test "adventure should be there" do
    assert_not_nil @adventure
    assert_not_nil @step
    assert_not_nil @step.adventure
  end

  test "should get index" do
    get :index, adventure_id: @adventure
    assert_response :success
    assert_not_nil assigns(:adventure)
    assert_not_nil assigns(:steps)
  end

  test "should get new" do
    get :new, adventure_id: @adventure
    assert_response :success
  end

  test "should create step" do
    assert_difference('Step.count') do
      post :create, adventure_id: @step.adventure_id, step: {  description: @step.description, title: @step.title }
    end

    assert_redirected_to adventure_path(assigns(:adventure))
  end

  test "should show step" do
    get :show, id: @step, adventure_id: @adventure
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @step, adventure_id: @adventure
    assert_response :success
  end

  test "should update step" do
    put :update, adventure_id: @adventure, id: @step, step: { description: @step.description, title: @step.title }
    assert_redirected_to adventure_path(assigns(:adventure))
  end

  test "should destroy step" do
    assert_difference('Step.count', -1) do
      delete :destroy, id: @step, adventure_id: @adventure
    end

    assert_redirected_to adventure_path(assigns(:adventure))
  end
end
