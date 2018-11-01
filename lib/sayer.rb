require 'enunciator'

class Sayer < Enunciator
  def initiator
    "Hello,"
  end

  def final_joiner
    "and"
  end

  def terminator
    "."
  end
end
