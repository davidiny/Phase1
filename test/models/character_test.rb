require 'test_helper'

class CharacterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
    should belong_to(:player)
    should belong_to(:risk_matrix)
    should belong_to(:decision)

end
