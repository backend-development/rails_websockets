require 'test_helper'

class AdventureHelperTest < ActionView::TestCase
  test 'unrelated user has status nil' do
    assert_nil describe_status([])
    assert_nil current_step([])
  end

  test 'show step user is working on' do
    statuses = %w(finished working)
    assert_equal 'currently working on step 2', describe_status(statuses)
    assert_equal 1, current_step(statuses)
  end

  test 'skip steps that are blocked' do
    statuses = %w(blocked working finished)
    assert_equal 'currently working on step 2', describe_status(statuses)
    assert_equal 1, current_step(statuses)
  end

  test 'show that user is finished with everything' do
    statuses = %w(finished finished finished)
    assert_equal 'finished with everything', describe_status(statuses)
    assert_equal 3, current_step(statuses)
  end

  test 'show next step to work on' do
    statuses = %w(finished finished not_started)
    assert_equal 'next up: step 3', describe_status(statuses)
    assert_equal 2, current_step(statuses)
  end

  test 'show next step to work on if blocked' do
    statuses = %w(blocked finished not_started)
    assert_equal 'next up: step 3', describe_status(statuses)
    assert_equal 2, current_step(statuses)
  end

  test 'show blocked as next step if user is finished with everything else' do
    statuses = %w(finished blocked finished)
    assert_equal 'next up: step 2', describe_status(statuses)
    assert_equal 1, current_step(statuses)
 end
end