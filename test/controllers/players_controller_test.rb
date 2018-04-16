require 'test_helper'

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    create_players
  end

  teardown do
    delete_players
  end
  
  test "should get index" do
    get players_url
    assert_response :success
    assert_not_nil assigns(:players)
  end

  test "should get new" do
    get "/players/new"
    assert_response :success
  end

  test "should get edit" do
    get edit_player_url(@player1.id)
    assert_not_nil assigns(:player)
    assert_equal 27, assigns(:player).age
    assert_response :success
  end

  test "should create a new player" do
    assert_difference('Player.count', 1) do
      post players_url, params: {player: { first_name: @player1.first_name, last_name: @player1.last_name, email: @player1.email, age: @player1.age, gender: @player1.gender, occupation: @player1.occupation}}
    end
    assert_redirected_to player_path(assigns(:player))
    assert_equal "Alex was added to the system.", flash[:notice]
  end

  test "should fail to create a new player" do
      post players_url, params: {player: { first_name: @player1.first_name, last_name: nil, email: @player1.email, age: @player1.age, gender: @player1.gender, occupation: @player1.occupation}}
    assert_template :new
  end

  test "should show player" do
    create_players
    get player_url(@player1)
    assert_not_nil assigns(:player)
    assert_equal 27, assigns(:player).age
    assert_response :success
  end

  test "should update a player" do
    patch player_url(@player1), params: {id: @player1.id, player: { first_name: @player1.first_name, last_name: @player1.last_name, email: @player1.email, age: 70, gender: @player1.gender, occupation: @player1.occupation}}
    assert_redirected_to player_url(@player1)
    assert_equal "Alex was updated in the system.", flash[:notice]   
  end

#   test "should fail to update a card" do
#     patch card_url(@first), params: {id: @first.id, card: { instructions: @first.instructions, card_text: @first.card_text, act: 2, alert_text: @first.alert_text, card_type: @first.card_type}}
#     assert_template :edit
#   end

  test "should destroy player" do
    assert_difference('Player.count', -1) do
      delete player_url(@player1)
    end
    assert_redirected_to players_path
    assert_equal "Alex was removed from the system.", flash[:notice]
  end
  
end