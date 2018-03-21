require 'test_helper'

class DecisionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_one(:character)
end
