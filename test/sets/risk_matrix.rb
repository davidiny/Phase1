module Contexts
  module RiskMatrix

    def create_risk_matrix
      @risk1    = FactoryBot.create(:risk_matrix)
      @risk2    = FactoryBot.create(:risk_matrix, risk_score: 17)
      @risk3   = FactoryBot.create(:risk_matrix, risk_score: 25 )
    end
    
    def destroy_risk_matrix
      @risk1.delete  
      @risk2.delete
      @risk3.delete
    end

  end
end