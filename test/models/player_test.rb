require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_one(:character) 
  
  should validate_presence_of(:last_name)
  should validate_presence_of(:gender)
end
