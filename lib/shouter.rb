require 'enunciator'

class Shouter < Enunciator
  def initiator
    "HELLO"
  end

  def final_joiner
    "AND"
  end

  def terminator
    "!"
  end
end
