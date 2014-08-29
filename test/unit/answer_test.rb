require 'test_helper'

class AnswerTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = answers(:one)
    assert record.save
  end

  test 'successful test two' do
    record = answers(:two)
    assert record.save
  end

  # title tests
  test 'fail if title nil' do
    record = answers(:one)
    record.title = nil
    assert !record.save
  end

  test 'fail if title empty' do
    record = answers(:one)
    record.title = ''
    assert !record.save
  end

  test 'success if title is short' do
    record = answers(:one)
    record.title = 'a'
    assert record.save
  end

  test 'success if title is long' do
    record = answers(:one)
    record.title = 'a'*128
    assert record.save
  end

  test 'fail if title is really long' do
    record = answers(:one)
    record.title = 'a'*129
    assert !record.save
  end

  # value tests
  test 'fail if value nil' do
    record = answers(:one)
    record.value = nil
    assert !record.save
  end

  test 'fail if value is non-number' do
    record = answers(:one)
    record.value = 'a'
    assert !record.save
  end

  test 'success if value is zero' do
    record = answers(:one)
    record.value = 0
    assert record.save
  end

  test "success if value is neg" do
    record = answers(:one)
    record.value = -1
    assert record.save
  end

  test 'success if value is one' do
    record = answers(:one)
    record.value = 1
    assert record.save
  end

  test 'success if value is real' do
    record = answers(:one)
    record.value = 1.1
    assert record.save
  end

  test "success if value is real neg" do
    record = answers(:one)
    record.value = -1.1
    assert record.save
  end

end
