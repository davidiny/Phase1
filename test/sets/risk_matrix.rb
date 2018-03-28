module Contexts
  module RiskMatrices

    def create_risk_matrix
      @risk1    = FactoryBot.create(:risk_matrix)
      @risk2    = FactoryBot.create(:risk_matrix, risk_score: 17)
      @risk3   = FactoryBot.create(:risk_matrix, risk_score: 20 )
    end
    
    def delete_risk_matrix
      @risk1.delete  
      @risk2.delete
      @risk3.delete
    end

  end
end