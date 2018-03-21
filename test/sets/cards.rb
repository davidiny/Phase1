module Contexts
  module Cards

    def create_cards
      @first    = FactoryBot.create(:card)
      @second    = FactoryBot.create(:card, text: 'This is the beginning...')
      @third   = FactoryBot.create(:card, character_card: @max3, instructions: 'Do not read this card if ...', type: 'complicity')
    end
    
    def destroy_cards
      @first.delete  
      @second.delete
      @third.delete
    end

  end
end