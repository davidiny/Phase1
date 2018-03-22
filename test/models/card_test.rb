require 'test_helper'

class CardTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  should validate_presence_of(:card_text)
  should validate_presence_of(:act)
  should validate_presence_of(:type)
end
