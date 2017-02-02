require 'test_helper'

class CreateAnAdventureTest < Capybara::Rails::TestCase
  def assert_permission_denied
    assert_content('permission denied')
  end

  test 'guest cannot create adventure' do
    visit new_adventure_path
    assert_permission_denied
  end

  test 'signed in user can create new adventure' do
    visit auth_testing_path(id: users(:three).id)
    assert_content('Logged in')
    visit new_adventure_path
    fill_in 'Title', with: 'Some Adventure this is'
    fill_in 'Description', with: 'do this and that and learn something'
    click_button('Create Adventure')
    assert_content('Adventure was successfully created.')
  end

  test 'signed in user can add stepstones to an adventure' do
    visit auth_testing_path(id: users(:three).id)
    assert_content('Logged in')
    visit new_adventure_path
    fill_in 'Title', with: 'Some Adventure this is'
    fill_in 'Description', with: 'do this and that and learn something'
    click_button('Create Adventure')
    assert_content('Adventure was successfully created.')
    assert_content('This Adventure consists of 0 steps')
    click_link('New Stepstone')
    fill_in('Description', with: 'step 1 of many')
    click_button('Create Stepstone')
    assert_content('This Adventure consists of 1 steps')
    assert_content('step 1 of many')
  end
end
