class Card < ApplicationRecord
    
  validates_presence_of :card_text, :act, :type
  validates_presence_of :alert_text, :allow_blank => true  
  validates_presence_of :instructions, :allow_blank => true 
  validates_numericality_of :type, :alert_text, :act, :card_text, :instructions 
  validates_numericality_of :act, :only_integer => true, :greater_than_or_equal_to => 0 
  
end
