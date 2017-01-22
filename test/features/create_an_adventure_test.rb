require 'test_helper'

class CreateAnAdventureTest < Capybara::Rails::TestCase
  def assert_permission_denied
    assert_content('permission denied')
  end

  test 'guest cannot create adventure' do
    visit new_adventure_path
    assert_permission_denied
  end

  test 'user can create empty adventure' do
    visit auth_testing_path
    assert_content('Logged in')
    visit new_adventure_path
    assert page.status_code
    fill_in 'Title', with: 'Some Adventure this is'
    fill_in 'Description', with: 'do this and that and learn something'
    click_button('Create Adventure')
    assert_content('Adventure was successfully created.')
  end

  test 'user cam create empty adventure' do
    visit auth_testing_path
    assert_content('Logged in')
    visit new_adventure_path
    fill_in 'Title', with: 'Some Adventure this is'
    fill_in 'Description', with: 'do this and that and learn something'
    click_button('Create Adventure')
    assert_content('Adventure was successfully created.')
  end
end
