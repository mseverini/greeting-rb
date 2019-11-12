class Enunciator
  def initialize(names)
    @names = names
  end

  def enunciate
    return "" if @names.empty?

    greeting = "#{@opening}#{@initial_join} #{@names.first}"

    @names[1..-2].each do |name|
      greeting += ", #{name}"
    end

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
