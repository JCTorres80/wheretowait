require 'test_helper'

class FlaggedWordTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = flagged_words(:one)
    assert record.save
  end

  test 'successful test two' do
    record = flagged_words(:two)
    assert record.save
  end

  # title tests
  test 'fail if word nil' do
    record = flagged_words(:one)
    record.word = nil
    assert !record.save
  end

  test 'fail if word empty' do
    record = flagged_words(:one)
    record.word = ''
    assert !record.save
  end

  test 'success if word is short' do
    record = flagged_words(:one)
    record.word = 'a'
    assert record.save
  end

  test 'success if word is long' do
    record = flagged_words(:one)
    record.word = 'a'*128
    assert record.save
  end

  test 'fail if word is really long' do
    record = flagged_words(:one)
    record.word = 'a'*129
    assert !record.save
  end

end
