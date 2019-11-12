require 'enunciator'
class Shouter < Enunciator
  def initialize(names)
    super(names)
    @opening = "HELLO"
    @preposition = "AND"
    @punctuation = "!"
    @initial_join = ""
  end
end
