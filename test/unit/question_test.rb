require 'test_helper'

class QuestionTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = questions(:one)
    assert record.save
  end

  test 'successful test two' do
    record = questions(:two)
    assert record.save
  end

  # title tests
  test 'fail if title nil' do
    record = questions(:one)
    record.title = nil
    assert !record.save
  end

  test 'fail if title empty' do
    record = questions(:one)
    record.title = ''
    assert !record.save
  end

  test 'success if title is short' do
    record = questions(:one)
    record.title = 'a'
    assert record.save
  end

  test 'success if title is long' do
    record = questions(:one)
    record.title = 'a'*128
    assert record.save
  end

  test 'fail if title is really long' do
    record = questions(:one)
    record.title = 'a'*129
    assert !record.save
  end

  # group tests
  test 'fail if group nil' do
    record = questions(:one)
    record.group = nil
    assert !record.save
  end

  test 'fail if group empty' do
    record = questions(:one)
    record.group = ''
    assert !record.save
  end

  test 'success if group is short' do
    record = questions(:one)
    record.group = 'a'
    assert record.save
  end

  test 'success if group is long' do
    record = questions(:one)
    record.group = 'a'*128
    assert record.save
  end

  test 'fail if group is really long' do
    record = questions(:one)
    record.group = 'a'*129
    assert !record.save
  end

  # answer_type tests
  test "fail if answer_type nil" do
    record = questions(:one)
    record.answer_type = nil
    assert !record.save
  end

  test "fail if answer_type empty" do
    record = questions(:one)
    record.answer_type = ''
    assert !record.save
  end

  test "fail if answer_type is incorrect type" do
    record = questions(:one)
    record.answer_type = 'wrong'
    assert !record.save
  end

  # unit
  test "success if unit nil" do
    record = questions(:one)
    record.unit = nil
    assert record.save
  end

  test "success if unit empty" do
    record = questions(:one)
    record.unit = ''
    assert record.save
  end

  test "fail if unit is too long" do
    record = questions(:one)
    record.unit = '%%'
    assert !record.save
  end

  test "success if unit is one" do
    record = questions(:one)
    record.unit = '%'
    assert record.save
  end

  test "success if unit is one dollar sign" do
    record = questions(:one)
    record.unit = '$'
    assert record.save
  end

end
