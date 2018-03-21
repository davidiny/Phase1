class Player < ApplicationRecord
    
  has_one:character
  
  validates_presence_of :last_name, :gender
  validates_numericality_of :age, :only_integer => true, :greater_than_or_equal_to => 0, :allow_blank => true
  validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format", :allow_blank => true
  validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only", :allow_blank => true

  scope :alphabetical, -> { order('last_name', 'first_name') }
  scope :search, ->(term) { where('first_name LIKE ? OR last_name LIKE ?', "#{term}%", "#{term}%") }

  def name
    last_name + ", " + first_name
  end
  
  def proper_name
    first_name + " " + last_name
  end


# Callback code
  private
     # We need to strip non-digits before saving to db
    def reformat_phone
      phone = self.phone.to_s  # change to string in case input as all numbers 
      phone.gsub!(/[^0-9]/,"") # strip all non-digits
      self.phone = phone       # reset self.phone to new string
    end
  
end

