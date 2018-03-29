require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    should belong_to(:player)
    should belong_to(:risk_matrix)
    should belong_to(:decision)
    
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:bio)
    should validate_presence_of(:gender)
    
    should validate_numericality_of(:player_id)
    should validate_numericality_of(:risk_matrix_id)
    should validate_numericality_of(:decision_id)


    context "Within context" do
      setup do 
        create_decisions
        create_risk_matrix
        create_players
        create_characters
      end
      
      
      teardown do
        delete_characters
        delete_players
        delete_risk_matrix
        delete_decisions
      end
    
      should "should order characters alphabetically and check name function" do
        assert_equal ["Griffin, Bob", "Johnson, Bob", "Terry, Bob"], Character.alphabetical.all.map{|c| c.name}
      end
      
      
      should "should order characters alphabetically and check proper_name function" do
        assert_equal ["Bob Griffin", "Bob Johnson", "Bob Terry"], Character.alphabetical.all.map{|c| c.proper_name}
      end
    end



end
