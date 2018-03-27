FactoryBot.define do
  
  factory :risk_matrix do
    risk_score '3,7,13,20'
  end



  factory :character do
    first_name "Bob"
    last_name "Griffin"
    bio "Born on September..."
    gender "M"
    assocation :risk_matrix 
    assocation :player 
    assocation :decision 
  end  
  

  factory :player do
    first_name "Alex"
    last_name "Din"
    email { |a| "#{a.first_name}.#{a.last_name}@example.com".downcase }
    age 27 
    gender "M"
    occupation "Salesman"

  end
  
  factory :card do
    instructions "Only draw this card if"
    card_text "One a stormy night in..."
    act 1
    alert_text "Skip this card if..."
    card_type "complicity"
  
  end
  
  factory :decision do
      decision_string "1,0,1,1"
  end

end