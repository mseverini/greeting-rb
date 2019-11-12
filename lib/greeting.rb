require 'csv'

class Greeting
  def self.greet(name)
    name = "my friend" if name.nil?

    said, shouted = parse_commas(Array(name)).partition { |el| el.upcase != el }

    join_greetings(said, shouted)
  end

  def self.join_greetings(said, shouted)
    greeting = ""
    greeting += say(said) if said.any?
    greeting += " AND " if said.any? and shouted.any?
    greeting += shout(shouted) if shouted.any?
    greeting
  end

  def self.say(names)
    opening = "Hello"
    preposition = "and"
    punctuation = "."
    initial_join = ","

    end_of_list = tail(names.length, final_name(preposition, names.last, punctuation), punctuation)
    enunciate(names, opening, initial_join, end_of_list)
  end

  def self.shout(names)
    opening = "HELLO"
    preposition = "AND"
    punctuation = "!"
    initial_join = ""

    end_of_list = tail(names.length, final_name(preposition, names.last, punctuation), punctuation)
    enunciate(names, opening, initial_join, end_of_list)
  end

  def self.tail(num_names, final_name, punctuation)
    case num_names
    when 1
      punctuation
    when 2
      " #{final_name}"
    else
      ", #{final_name}"
    end
  end

  def self.final_name(preposition, final_name, punctuation)
    "#{preposition} #{final_name}#{punctuation}"
  end

  def self.enunciate(names, opening, initial_join, end_of_list)
    greeting = "#{opening}#{initial_join} #{names.first}"

    names[1..-2].each do |name|
      greeting += ", #{name}"
    end

    "#{greeting}#{end_of_list}"
  end

  def self.parse_commas(names)
    names.flat_map{|name| CSV.parse(name)}.flatten.map{|name| name.strip}
  end
end
