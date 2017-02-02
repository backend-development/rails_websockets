require 'test_helper'

class AdventureHelperTest < ActionView::TestCase
  test 'unrelated user has status nil' do
    assert_nil describe_status([])
  end

  test 'show step user is working on' do
    assert_equal 'currently working on step 2', describe_status(%w(finished working))
  end
end