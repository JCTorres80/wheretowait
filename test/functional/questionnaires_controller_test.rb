require 'test_helper'

class QuestionnairesControllerTest < ActionController::TestCase
  setup do
    @questionnaire = questionaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questionnaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create questionnaire" do
    assert_difference('Questionnaire.count') do
      post :create, questionnaire: {  }
    end

    assert_redirected_to questionaire_path(assigns(:questionnaire))
  end

  test "should show questionnaire" do
    get :show, id: @questionnaire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @questionnaire
    assert_response :success
  end

  test "should update questionnaire" do
    put :update, id: @questionnaire, questionnaire: {  }
    assert_redirected_to questionaire_path(assigns(:questionnaire))
  end

  test "should destroy questionnaire" do
    assert_difference('Questionnaire.count', -1) do
      delete :destroy, id: @questionnaire
    end

    assert_redirected_to questionaires_path
  end
end
