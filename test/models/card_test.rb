require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should validate_presence_of(:card_text)
  should validate_presence_of(:act)
  should validate_presence_of(:card_type)
  should validate_numericality_of(:act)
  
  
  should allow_value("ABCDEFG").for(:card_text)
  should allow_value("abcdefg hijklmnop qrstu vqxyz").for(:instructions)
  should allow_value("abcdefg hijklmnop qrstu vqxyz").for(:alert_text)
  should allow_value("complicity").for(:card_type)
  should allow_value(2).for(:act)
  should allow_value(0).for(:act)
  should_not allow_value(-1).for(:act)
  
  
  should_not allow_value(nil).for(:card_text)
  should_not allow_value(nil).for(:act)
  should_not allow_value(nil).for(:card_type)
  should allow_value(nil).for(:instructions)
  should allow_value(nil).for(:alert_text)
  
  # set up context
  context "Within context" do
    setup do 
      create_cards
    end
    
    
    teardown do
      delete_cards
    end
    
    
    should "shows that there are 3 cards for act 1" do
      assert_equal 3, Card.for_act(1).size
    end
    
    should "shows that there are 2 complicity cards" do
      assert_equal 2, Card.for_type("complicity").size
    end
    
  end

end
