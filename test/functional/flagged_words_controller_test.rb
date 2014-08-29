require 'test_helper'

class FlaggedWordsControllerTest < ActionController::TestCase
  setup do
    @flagged_word = flagged_words(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flagged_words)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flagged_word" do
    assert_difference('FlaggedWord.count') do
      post :create, flagged_word: {  }
    end

    assert_redirected_to flagged_word_path(assigns(:flagged_word))
  end

  test "should show flagged_word" do
    get :show, id: @flagged_word
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flagged_word
    assert_response :success
  end

  test "should update flagged_word" do
    put :update, id: @flagged_word, flagged_word: {  }
    assert_redirected_to flagged_word_path(assigns(:flagged_word))
  end

  test "should destroy flagged_word" do
    assert_difference('FlaggedWord.count', -1) do
      delete :destroy, id: @flagged_word
    end

    assert_redirected_to flagged_words_path
  end
end
