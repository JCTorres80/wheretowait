require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase

  # success tests
  test 'successful test one' do
    record = questionnaires(:one)
    assert record.save
  end

  test 'successful test two' do
    record = questionnaires(:two)
    assert record.save
  end

  # user tests
  test 'fail if user nil' do
    record = questionnaires(:one)
    record.user = nil
    assert !record.save
  end

  # location tests
  test 'fail if location nil' do
    record = questionnaires(:one)
    record.location = nil
    assert !record.save
  end

  # comment tests
  test "fail if comment nil" do
    record = questionnaires(:one)
    record.comment = nil
    assert !record.save
  end

  test "fail if comment empty" do
    record = questionnaires(:one)
    record.comment = ''
    assert !record.save
  end

  test "success if comment is short" do
    record = questionnaires(:one)
    record.comment = 'a'
    assert record.save
  end

  test "success if comment is long" do
    record = questionnaires(:one)
    record.comment = 'a'*5000
    assert record.save
  end

  test "fail if comment is really long" do
    record = questionnaires(:one)
    record.comment = 'a'*5001
    assert !record.save
  end

  test "comment flagged if includes the word one" do
    record = questionnaires(:one)
    record.comment = 'hello one world'
    record.save
    assert record.flagged
  end

  test "comment flagged if includes the word one first" do
    record = questionnaires(:one)
    record.comment = 'one hello world'
    record.save
    assert record.flagged
  end

  test "comment flagged if includes the word one last" do
    record = questionnaires(:one)
    record.comment = 'hello world one'
    record.save
    assert record.flagged
  end

  test "comment flagged if includes the word one caps" do
    record = questionnaires(:one)
    record.comment = 'hello oNe world'
    record.save
    assert record.flagged
  end

  test "comment flagged if includes the word one first caps" do
    record = questionnaires(:one)
    record.comment = 'One hello world'
    record.save
    assert record.flagged
  end

  test "comment flagged if includes the word one last caps" do
    record = questionnaires(:one)
    record.comment = 'hello world onE'
    record.save
    assert record.flagged
  end

  test "comment not flagged if includes the word alone" do
    record = questionnaires(:one)
    record.comment = 'hello alone world'
    record.save
    assert !record.flagged
  end

  test "comment flagged if includes the right multi word phrase" do
    record = questionnaires(:one)
    record.comment = 'johnny is sleeping with a teddy bear'
    record.save
    assert record.flagged
  end

  test "comment not flagged if includes the word one and already moderated" do
    record = questionnaires(:one)
    record.moderated = true
    record.comment = 'hello one world'
    record.save
    assert !record.flagged
  end

end
