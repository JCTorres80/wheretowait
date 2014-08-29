require 'test_helper'

class UserTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = users(:one)
    assert record.save
  end

  test 'successful test two' do
    record = users(:two)
    assert record.save
  end

  # city tests
  test 'fail if city nil' do
    record = users(:one)
    record.city = nil
    assert !record.save
  end

  test 'fail if city empty' do
    record = users(:one)
    record.city = ''
    assert !record.save
  end

  test 'success if city is short' do
    record = users(:one)
    record.city = 'a'
    assert record.save
  end

  test 'success if city is long' do
    record = users(:one)
    record.city = 'a'*128
    assert record.save
  end

  test 'fail if city is really long' do
    record = users(:one)
    record.city = 'a'*129
    assert !record.save
  end

  # state tests
  test 'fail if state nil' do
    record = users(:one)
    record.state = nil
    assert !record.save
  end

  test 'fail if state empty' do
    record = users(:one)
    record.state = ''
    assert !record.save
  end

  test 'success if state is short' do
    record = users(:one)
    record.state = 'a'
    assert record.save
  end

  test 'success if state is long' do
    record = users(:one)
    record.state = 'a'*128
    assert record.save
  end

  test 'fail if state is really long' do
    record = users(:one)
    record.state = 'a'*129
    assert !record.save
  end

  # zip_code tests
  test 'fail if zip_code nil' do
    record = users(:one)
    record.zip_code = nil
    assert !record.save
  end

  test 'fail if zip_code empty' do
    record = users(:one)
    record.zip_code = ''
    assert !record.save
  end

  test 'fail if zip_code is too short' do
    record = users(:one)
    record.zip_code = '1'*4
    assert !record.save
  end

  test 'success if zip_code is short' do
    record = users(:one)
    record.zip_code = '1'*5
    assert record.save
  end

  test 'success if zip_code is long' do
    record = users(:one)
    record.zip_code = '11111-1111'
    assert record.save
  end

  test 'fail if zip_code is really long' do
    record = users(:one)
    record.zip_code = '1'*10
    assert !record.save
  end

  test 'fail if zip_code is letters' do
    record = users(:one)
    record.zip_code = 'a'*5
    assert !record.save
  end

  # birthday tests
  test 'fail if birthday nil' do
    record = users(:one)
    record.birthday = nil
    assert !record.save
  end

  test 'fail if birthday empty' do
    record = users(:one)
    record.birthday = ''
    assert !record.save
  end

  test 'fail if birthday is letters' do
    record = users(:one)
    record.birthday = 'aaaa-aa-aa'
    assert !record.save
  end

  test 'fail if birthday is invalid' do
    record = users(:one)
    record.birthday = '9999-99-99'
    assert !record.save
  end

  test 'success if birthday is valid' do
    record = users(:one)
    record.birthday = '1991-12-12'
    assert record.save
  end

  # gender tests
  test 'fail if gender nil' do
    record = users(:one)
    record.gender = nil
    assert !record.save
  end

  test 'fail if gender empty' do
    record = users(:one)
    record.gender = ''
    assert !record.save
  end

  test 'fail if gender is invalid type' do
    record = users(:one)
    record.gender = 'wrong'
    assert !record.save
  end

  # role tests
  test 'fail if role nil' do
    record = users(:one)
    record.role = nil
    assert !record.save
  end

  test 'fail if role empty' do
    record = users(:one)
    record.role = ''
    assert !record.save
  end

  test 'fail if role is invalid type' do
    record = users(:one)
    record.role = 'wrong'
    assert !record.save
  end

  # terms_of_service_confirmed_at tests
  test 'fail if terms_of_service_confirmed_at is nil' do
    record = users(:one)
    record.terms_of_service_confirmed_at = nil
    assert !record.save
  end

  test 'fail if terms_of_service_confirmed_at is empty' do
    record = users(:one)
    record.terms_of_service_confirmed_at = ''
    assert !record.save
  end

  # timezone tests
  test 'fail if timezone is nil' do
    record = users(:one)
    record.timezone = nil
    assert !record.save
  end

  test 'fail if timezone is empty' do
    record = users(:one)
    record.timezone = ''
    assert !record.save
  end

end
