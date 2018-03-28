class RiskMatrix < ApplicationRecord
    
    has_one:character
    
    validates_presence_of :risk_score
    
    scope :ordered, -> { order("risk_score")}
  
  
    def add_risk(number)
        self.risk_score += number
    end
end
