module Contexts
  module Decisions

    def create_decisions
      @decision1    = FactoryBot.create(:decision)
      @decision2    = FactoryBot.create(:decision, decision_string: '1,0,1,1' )
      @decision3   = FactoryBot.create(:decision, decision_string: '0,0,1,1')
    end
    
    def destroy_decisions
      @decision1.delete  
      @decision2.delete
      @decision3.delete
    end

  end
end