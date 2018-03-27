class Card < ApplicationRecord
    
  validates_presence_of :card_text, :act, :card_type
  validates_presence_of :alert_text, :allow_blank => true  
  validates_presence_of :instructions, :allow_blank => true 
  validates_numericality_of :act, :only_integer => true, :greater_than_or_equal_to => 0 
  
  scope :for_act, ->(act_number) { where("act = ?", act_number)}
  scope :for_type, ->(card_type) { where("card_type = ?", card_type)}
  

  
  
end
