module Contexts
  module Characters

    def create_characters
      @max1    = FactoryBot.create(:character, risk_matrix: @risk1, decision: @decision1, player: @player2)
      @izak1    = FactoryBot.create(:character, player: @player2, risk_matrix: @risk2, decision: @decision2, last_name: "Terry")
      @josef1   = FactoryBot.create(:character, player: @player3, risk_matrix: @risk3, decision: @decision3, last_name: "Johnson")
    end
    
    def delete_characters
      @max1.delete  
      @izak1.delete
      @josef1.delete
    end

  end
end