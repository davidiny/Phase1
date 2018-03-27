module Contexts
  module Cards

    def create_cards
      @first    = FactoryBot.create(:card)
      @second    = FactoryBot.create(:card, card_text: 'This is the beginning...')
      @third  = FactoryBot.create(:card, instructions: 'Do not read this card if ...', card_type: 'regular')
    end
    
    def delete_cards
      @first.delete  
      @second.delete
      @third.delete
    end

  end
end