class Decision < ApplicationRecord
    
    has_one :character
    
    validates_presence_of(:decision_string)
end
