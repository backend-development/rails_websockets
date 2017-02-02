require 'test_helper'

class AdventureHelperTest < ActionView::TestCase
  test 'unrelated user has status nil' do
    assert_nil describe_status([])
  end

  test 'show step user is working on' do
    assert_equal 'currently working on step 2', describe_status(%w(finished working))
  end

  test 'show that user is finished with everything' do
    assert_equal 'finished with everything', describe_status(%w(finished finished finished))
  end

  test 'show next step to work on' do
    assert_equal 'next up: step 3', describe_status(%w(finished finished not_started))
  end
end