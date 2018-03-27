require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_one(:character)
  
  should validate_presence_of(:decision_string)
  
  should allow_value("1,0,1,1,1,1").for(:decision_string)
  should_not allow_value(nil).for(:decision_string)
  
  context "Within context" do
    setup do 
      create_decisions
    end
    
    
    teardown do
      delete_decisions
    end
    
    should "shows that the second decision was 0" do
      assert_equal 0, @decision1.access_decision(1)
    end
    
    should "add 1 to end of decision" do
      assert_equal "1,0,1,1", @decision1.decision_string
      @decision1.add_to_decision(1)
      assert_equal "1,0,1,1,1", @decision1.decision_string
    end
    
    
  end
  
end
