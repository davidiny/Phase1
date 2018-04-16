require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_cards
  end

  teardown do
    delete_cards
  end
  
  test "should get index" do
    get cards_url
    assert_response :success
    assert_not_nil assigns(:all_cards)
  end

  test "should get new" do
    get "/cards/new"
    assert_response :success
  end

  test "should get edit" do
    get edit_card_url(@first.id)
    assert_not_nil assigns(:card)
    assert_equal "complicity", assigns(:card).card_type
    assert_response :success
  end

  test "should create a new card" do
    assert_difference('Card.count', 1) do
      post cards_url, params: {card: { instructions: @first.instructions, card_text: @first.card_text, act: 3, alert_text: @first.alert_text, card_type: @first.card_type}}
    end
    assert_redirected_to card_path(assigns(:card))
    assert_equal "complicity was added to the system.", flash[:notice]
  end

  test "should fail to create a new card" do
      post cards_url, params: {card: { instructions: @first.instructions, card_text: @first.card_text, act: 3, alert_text: @first.alert_text, card_type: nil}}
    assert_template :new
  end

  test "should show card" do
    create_cards
    get card_url(@first)
    assert_not_nil assigns(:card)
    assert_equal 1, assigns(:card).act
    assert_response :success
  end

  test "should update a card" do
    patch card_url(@first), params: {id: @first.id, card: { instructions: @first.instructions, card_text: @first.card_text, act: 2, alert_text: @first.alert_text, card_type: @first.card_type}}
    assert_redirected_to card_url(@first)
    assert_equal "complicity was updated in the system.", flash[:notice]   
  end

#   test "should fail to update a card" do
#     patch card_url(@first), params: {id: @first.id, card: { instructions: @first.instructions, card_text: @first.card_text, act: 2, alert_text: @first.alert_text, card_type: @first.card_type}}
#     assert_template :edit
#   end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@first)
    end
    assert_redirected_to cards_path
    assert_equal "complicity was removed from the system.", flash[:notice]
  end
  
end