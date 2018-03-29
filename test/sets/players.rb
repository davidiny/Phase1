module Contexts
  module Players

    def create_players
      @player1    = FactoryBot.create(:player)
      @player2    = FactoryBot.create(:player, last_name: "Bobby", age: 27, email: 'lobobby@gmail.com')
      @player3   = FactoryBot.create(:player, first_name: "Arthur", age: 30, occupation: 'golf player')
    end
    
    def delete_players
      @player1.delete  
      @player2.delete
      @player3.delete
    end

  end
end