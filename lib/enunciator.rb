class Enunciator
  def initialize(names)
    @names = names
  end

  def enunciate
    return "" if @names.empty?

    greeting = "#{@opening} #{@names.first}"

    @names[1...-1].each{ |name| greeting += ", #{name}" }

    "#{greeting}#{tail}"
  end

  private

  def tail
    case @names.length
    when 1
      @punctuation
    when 2
      " #{final_name}"
    else
      ", #{final_name}"
    end
  end

  def final_name
    "#{@preposition} #{@names.last}#{@punctuation}"
  end
end
