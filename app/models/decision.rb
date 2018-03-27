class Decision < ApplicationRecord
    
    has_one :character
    
    validates_presence_of(:decision_string)
    
    
    def access_decision(decision)
        all_decisions = self.decision_string.split(",")
        return all_decisions[decision].to_i
    end
    
    def add_to_decision(decision)
        if self.decision_string == ""
            self.decision_string = "#{decision},"
        else
            all_decisions = self.decision_string.split(",")
            all_decisions.push(decision)
            self.decision_string = all_decisions.join(",")
        end
    end
    
    
    
end
