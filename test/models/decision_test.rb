require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_one(:character)
  
  should validate_presence_of(:decision_string)
  
end
