require 'csv'
require 'sayer'
require 'shouter'

class Greeting
  def self.greet(name)
    name = "my friend" if name.nil?

    said, shouted = parse_commas(Array(name)).partition { |el| el.upcase != el }

    join =  (said.any? and shouted.any?) ? " AND " : ""
    Sayer.new(said).enunciate + join + Shouter.new(shouted).enunciate
  end

  def self.parse_commas(names)
    names.map{|name| CSV.parse(name)}.flatten.map{|name| name.strip}
  end
end
