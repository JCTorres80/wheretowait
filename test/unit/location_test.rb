require 'test_helper'

class LocationTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = locations(:one)
    assert record.save
  end

  test 'successful test two' do
    record = locations(:two)
    assert record.save
  end

  # name tests
  test 'fail if name nil' do
    record = locations(:one)
    record.name = nil
    assert !record.save
  end

  test 'fail if name empty' do
    record = locations(:one)
    record.name = ''
    assert !record.save
  end

  test 'success if name is short' do
    record = locations(:one)
    record.name = 'a'
    assert record.save
  end

  test 'success if name is long' do
    record = locations(:one)
    record.name = 'a'*128
    assert record.save
  end

  test 'fail if name is really long' do
    record = locations(:one)
    record.name = 'a'*129
    assert !record.save
  end

  # phone tests
  test 'fail if phone nil' do
    record = locations(:one)
    record.phone = nil
    assert !record.save
  end

  test 'fail if phone empty' do
    record = locations(:one)
    record.phone = ''
    assert !record.save
  end

  test 'fail if phone is letters' do
    record = locations(:one)
    record.phone = 'a'
    assert !record.save
  end

  test "fail if phone is just short letters" do
    record = locations(:one)
    record.phone = 'a'*9
    assert !record.save
  end

  test "fail if phone is long letters" do
    record = locations(:one)
    record.phone = 'a'*10
    assert !record.save
  end

  test "fail if phone is short" do
    record = locations(:one)
    record.phone = '123456789'
    assert !record.save
  end

  test "success if phone is just numbers" do
    record = locations(:one)
    record.phone = '1234567890'
    assert record.save
  end

  test "success if phone is formatted numbers" do
    record = locations(:one)
    record.phone = '(123)456-7890'
    assert record.save
  end

  test "success if phone is spaced numbers" do
    record = locations(:one)
    record.phone = '123 456 7890'
    assert record.save
  end

  test "success if phone is dotted numbers" do
    record = locations(:one)
    record.phone = '123.456.7890'
    assert record.save
  end

  test "success if phone is long numbers" do
    record = locations(:one)
    record.phone = '123456789012345'
    assert record.save
  end

  test "fail if phone is too long" do
    record = locations(:one)
    record.phone = '1234567890123456'
    assert !record.save
  end

  # address tests
  test "fail if address nil" do
    record = locations(:one)
    record.address = nil
    assert !record.save
  end

  test "fail if address empty" do
    record = locations(:one)
    record.address = ''
    assert !record.save
  end

  test "success if address is short" do
    record = locations(:one)
    record.address = 'a'
    assert record.save
  end

  test "success if address is long" do
    record = locations(:one)
    record.address = 'a'*128
    assert record.save
  end

  test "fail if address is really long" do
    record = locations(:one)
    record.address = 'a'*129
    assert !record.save
  end

  # location_type tests
  test "fail if location_type nil" do
    record = locations(:one)
    record.location_type = nil
    assert !record.save
  end

  test "fail if location_type empty" do
    record = locations(:one)
    record.location_type = ''
    assert !record.save
  end

  test "fail if location_type is not of proper type" do
    record = locations(:one)
    record.location_type = 'blah'
    assert !record.save
  end

  # website tests
  test "fail if website nil" do
    record = locations(:one)
    record.website = nil
    assert !record.save
  end

  test "fail if website empty" do
    record = locations(:one)
    record.website = ''
    assert !record.save
  end

  test "success if website is short" do
    record = locations(:one)
    record.website = 'http://www.a.com'
    assert record.save
  end

  test "success if website is long" do
    record = locations(:one)
    record.website = 'http://www.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghi.com'
    assert record.save
  end

  test "fail if website is really long" do
    record = locations(:one)
    record.website =  'http://www.abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghij.com'
    assert !record.save
  end

end
