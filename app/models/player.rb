class Player < ApplicationRecord
    
  has_one:character
  
  validates_presence_of :last_name, :gender
  validates_numericality_of :age, :only_integer => true, :greater_than_or_equal_to => 0, :allow_blank => true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format", :allow_blank => true

  scope :alphabetical, -> { order('last_name', 'first_name') }
  scope :search, ->(term) { where('first_name LIKE ? OR last_name LIKE ?', "#{term}%", "#{term}%") }

  def name
    last_name + ", " + first_name
  end
  
  def proper_name
    first_name + " " + last_name
  end


# Callback code

  
end

