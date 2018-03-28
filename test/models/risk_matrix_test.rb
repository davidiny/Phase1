require 'test_helper'

class RiskMatrixTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_one(:character)
  
  should allow_value(20).for(:risk_score)
  should allow_value(0).for(:risk_score)
  should_not allow_value(nil).for(:risk_score)
  
  context "Within context" do
    setup do 
      create_risk_matrix
    end
    
    
    teardown do
      delete_risk_matrix
    end
    
    
    should "increase risk matrix from 25 to 30" do
      assert_equal 25, @risk1.risk_score
      @risk1.add_risk(5)
      assert_equal 30, @risk1.risk_score
    end
    
    
    
  end
  
  
  
  
end
