class Enunciator
  def initialize(names)
    @names = names
  end

  def joiner
    ","
  end

  def enunciate
    build_greeting if @names.any?
  end

  def build_greeting
    greeting = "#{initiator} #{@names[0]}"
    @names[1..-2].each do |name|
      greeting += "#{joiner} #{name}"
    end
    join_final(greeting)
  end

  def join_final(greeting)
    case @names.length
    when 1
      "#{greeting}#{terminator}"
    when 2
      "#{greeting}#{end_of_list}"
    else
      "#{greeting}#{joiner}#{end_of_list}"
    end
  end

  def end_of_list
    " #{final_joiner} #{@names.last}#{terminator}"
  end
end
