require 'shouter'
require 'sayer'

class Greeting
  def initialize(names)
    @names = Array(names)
    handle_names
    split_names
  end

  def greet
    shouting = @shouter.enunciate
    saying = @sayer.enunciate
    return "#{saying} AND #{shouting}" if saying && shouting
    saying || shouting
  end

  def split_names
    shouted_names = @names.select{|name| name == name.upcase }
    spoken_names = @names.empty? ? ["my friend"] : @names.select{|name| name != name.upcase }

    @shouter = Shouter.new(@names.select{|name| name == name.upcase })
    @sayer = Sayer.new(spoken_names)
  end

  def handle_names
    @names = @names.map{|name|
      name.match?(/\".*\"/) ? name[1..-2] : name.split(", ")
    }.flat_map{|i| i}
  end
end
