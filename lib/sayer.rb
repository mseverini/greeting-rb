require 'enunciator'
class Sayer < Enunciator
  def initialize(names)
    super(names)
    @opening = "Hello"
    @preposition = "and"
    @punctuation = "."
    @initial_join = ","
  end
end
