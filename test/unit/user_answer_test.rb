require 'test_helper'

class UserAnswerTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = user_answers(:one)
    assert record.save
  end

  test 'successful test two' do
    record = user_answers(:two)
    assert record.save
  end

  # value tests
  test 'fail if value nil' do
    record = user_answers(:one)
    record.value = nil
    assert !record.save
  end

  test 'fail if value is non-number' do
    record = user_answers(:one)
    record.value = 'a'
    assert !record.save
  end

  test 'success if value is zero' do
    record = user_answers(:one)
    record.value = 0
    assert record.save
  end

  test "success if value is neg" do
    record = user_answers(:one)
    record.value = -1
    assert record.save
  end

  test 'success if value is one' do
    record = user_answers(:one)
    record.value = 1
    assert record.save
  end

  test 'success if value is real' do
    record = user_answers(:one)
    record.value = 1.1
    assert record.save
  end

  test "success if value is real neg" do
    record = user_answers(:one)
    record.value = -1.1
    assert record.save
  end

  # question tests
  test 'fail if question nil' do
    record = user_answers(:one)
    record.question = nil
    assert !record.save
  end

  # questionnaire tests
  test 'fail if questionnaire nil' do
    record = user_answers(:one)
    record.questionnaire = nil
    assert !record.save
  end

end
