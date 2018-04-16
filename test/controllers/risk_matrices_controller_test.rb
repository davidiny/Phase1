require 'test_helper'

class RiskMatricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_risk_matrix
  end

  teardown do
    delete_risk_matrix
  end
  
  test "should get risk_matrix" do
    get risk_matrices_url
    assert_response :success
    assert_not_nil assigns(:risk_matrix)
  end

  test "should get new" do
    get "/risk_matrices/new"
    assert_response :success
  end

  test "should get edit" do
    get edit_risk_matrix_url(@risk1.id)
    assert_not_nil assigns(:risk_matrix)
    assert_equal 25, assigns(:risk_matrix).risk_score
    assert_response :success
  end

  test "should create a new risk_matrix" do
    assert_difference('RiskMatrix.count', 1) do
      post risk_matrices_url, params: {risk_matrix: { risk_score: 20}}
    end
    assert_redirected_to risk_matrix_path(assigns(:risk_matrix))
    assert_equal "The risk matrix was added to the system.", flash[:notice]
  end

  test "should fail to create a new risk_matrix" do
      post risk_matrices_url, params: {risk_matrix: { risk_score: nil}}
    assert_template :new
  end

  test "should show risk matrix" do
    create_risk_matrix
    get risk_matrix_url(@risk1)
    assert_not_nil assigns(:risk_matrix)
    assert_equal 25, assigns(:risk_matrix).risk_score
    assert_response :success
  end

  test "should update a risk matrix" do
    patch risk_matrix_url(@risk1), params: {id: @risk1.id, risk_matrix: { risk_score: 40}}
    assert_redirected_to risk_matrix_url(@risk1)
    assert_equal "The risk matrix was updated in the system.", flash[:notice]   
  end

#   test "should fail to update a card" do
#     patch card_url(@first), params: {id: @first.id, card: { instructions: @first.instructions, card_text: @first.card_text, act: 2, alert_text: @first.alert_text, card_type: @first.card_type}}
#     assert_template :edit
#   end

  test "should destroy risk_matrix" do
    assert_difference('RiskMatrix.count', -1) do
      delete risk_matrix_url(@risk1)
    end
    assert_redirected_to risk_matrices_path
    assert_equal "The risk matrix was removed from the system.", flash[:notice]
  end
  
end