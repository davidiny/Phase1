# require needed files
require './test/sets/cards'
require './test/sets/players'
require './test/sets/characters'
require './test/sets/decisions'
require './test/sets/risk_matrix'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Cards
  include Contexts::Players
  include Contexts::RiskMatrices
  include Contexts::Decisions
  include Contexts::Characters
end