require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  should have_many(:characters) 
  
  should validate_presence_of(:last_name)
  should validate_presence_of(:gender)

  should allow_value(0).for(:age)
  should allow_value(20).for(:age)
  should_not allow_value(-1).for(:age)
  should_not allow_value("string").for(:age)
  
  context "Within context" do
    setup do 
      create_players
    end
    
    
    teardown do
      delete_players
    end
    
    should "should order players alphabetically and check name function" do
      assert_equal ["Bobby, Alex", "Din, Alex", "Din, Arthur"], Player.alphabetical.all.map{|p| p.name}
    end
    
    should "should search for Bobby" do
      assert_equal ["Bobby, Alex"], Player.search("Bobby").all.map{|p| p.name}
    end
    
    should "should order players alphabetically and check proper_name function" do
      assert_equal ["Alex Bobby", "Alex Din", "Arthur Din"], Player.alphabetical.all.map{|p| p.proper_name}
    end
  end
  
end
