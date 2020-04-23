

class Player
  attr_reader :name

  def initialize
     @name 
  end

  def intro
  puts "Ecris ton nom de combattant:"
    print ">"
    @name = gets.chomp.to_s
    puts " Salut #{@name},bienvenue dans cette super partie de morpions  !"
  end

end #end class player
