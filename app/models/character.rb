class Character < ApplicationRecord
    
  belongs_to :player
  belongs_to :risk_matrix
  belongs_to :decision
  
  validates_presence_of :first_name, :last_name, :bio, :gender 
  validates_numericality_of :player_id, :only_integer => true, :greater_than_or_equal_to => 0 
  validates_numericality_of :risk_matrix_id, :only_integer => true, :greater_than_or_equal_to => 0 
  validates_numericality_of :decision_id, :only_integer => true, :greater_than_or_equal_to => 0 
  
  scope :alphabetical, -> { order('last_name', 'first_name') }
  
  
  def name
    last_name + ", " + first_name
  end
  
  def proper_name
    first_name + " " + last_name
  end


  
end
