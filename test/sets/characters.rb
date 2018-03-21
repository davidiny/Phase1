module Contexts
  module Characters

    def create_characters
      @max1    = FactoryBot.create(:character, player: @player1, risk_matrix: @risk1, decision: @decision1)
      @izak1    = FactoryBot.create(:character, player: @player2, risk_matrix: @risk2, decision: @decision2)
      @josef1   = FactoryBot.create(:character, player: @player3, risk_matrix: @risk3, decision: @decision3)
    end
    
    def destroy_characters
      @max1.delete  
      @izak1.delete
      @josef1.delete
    end

  end
end