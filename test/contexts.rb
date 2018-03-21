# require needed files
require './test/sets/card'
require './test/sets/player'
require './test/sets/character'
require './test/sets/decision'
require './test/sets/risk_matrix'

module Contexts
  # explicitly include all sets of contexts used for testing 
  include Contexts::Card
  include Contexts::Character
  include Contexts::Decision
  include Contexts::Player
  include Contexts::RiskMatrix
end