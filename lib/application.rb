class Application

  	attr_accessor :player1, :player2, :game_board

	def initialize (player1, player2)
		@player1 = player1
		@player2 = player2
		@game_board = Board.new
  end 


  def perform

    system "clear" # pr que ça s'affiche bien dans mon terminal
  @game_board.print_case
    t = 0

    while !@game_board.is_over? #tant que la partie n'est pas finie
    puts "Choisis une case #{@player1.name}"
    input_1 = gets.chomp.to_s #je demande une case au joueur
    process(input_1)
    break if @game_board.is_over?
    puts "Choisis une case #{@player2.name}" 
    input_2 = gets.chomp.to_s
    process(input_2)#ma def que j'explique ensuite, qui transforme mon input ici laposition
    end

    puts "#{player2.name} a gagné ! youhouuuuuu" if @game_board.victory? == 1 
    puts "#{player1.name} a gagné ! youhouuuuuu" if @game_board.victory? == 2
    puts "MATCHHHH NUUUUL !!! " if @game_board.victory? == nil
    puts "BYE BYYEEE LOVE GUYS "

  end 



def process(input)
    
    while input !="A1" && input !="A2" && input !="A3" && input !="B1" && input !="B2" && input !="B3" && input !="C1" && input !="C2" && input !="C3" 
      puts "Mets un nombre valide !"#condition pour ne pas que le joueur tape n'importe quoi !
      input = gets.chomp.to_s
    end 

    case input # case est une méthode dite de statement pour introduire des scenarios avec un when avant le if, on met alors une hiérarchie de conditions

    when "A1" #on regarde ce qui se passe quand on tappe A1
      #check si la case est disponible
      if @game_board.is_free?(0,0) then #méthode définie dans boardcase puis board au tour 1
        if @game_board.player1_next? #méthode avec le moduloo de 2 , fausse si nbre de tours est pair ce n'est pas au joueur 1
          @game_board.check(0,0,1) #méthode qui regarde s'il y a eu une nuvelle valeur, et si oui, on augmente d'un tour
          @game_board.print_case # au tour 2
        else
          @game_board.check(0,0,2) #au tour 3
          @game_board.print_case #imprime une nouvelle case selon les conditions de la méthode dans board
        end
      else
        puts "case deja prise, ça passe ton tour"
      end


    when "A2"
      if @game_board.is_free?(0,1) then
        if @game_board.player1_next?
          @game_board.check(0,1,1)
          @game_board.print_case
        else
          @game_board.check(0,1,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "A3"
      if @game_board.is_free?(0,2) then
        if @game_board.player1_next?
          @game_board.check(0,2,1)
          @game_board.print_case
        else
          @game_board.check(0,2,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "B1"
      if @game_board.is_free?(1,0) then
        if @game_board.player1_next?
          @game_board.check(1,0,1)
          @game_board.print_case
        else
          @game_board.check(1,0,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "B2"
      if @game_board.is_free?(1,1) then
        if @game_board.player1_next?
          @game_board.check(1,1,1)
          @game_board.print_case
        else
          @game_board.check(1,1,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "B3"
      if @game_board.is_free?(1,2) then
        if @game_board.player1_next?
          @game_board.check(1,2,1)
          @game_board.print_case
        else
          @game_board.check(1,2,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "C1"
      if @game_board.is_free?(2,0) then
        if @game_board.player1_next?
          @game_board.check(2,0,1)
          @game_board.print_case
        else
          @game_board.check(2,0,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "C2"
      if @game_board.is_free?(2,1) then
        if @game_board.player1_next?
          @game_board.check(2,1,1)
          @game_board.print_case
        else
          @game_board.check(2,1,2)
          @game_board.print_case
        end
      else
        puts "case deja prise, ça passe ton tour"
      end

    when "C3"
      if @game_board.is_free?(2,2) then
        if @game_board.player1_next?
          @game_board.check(2,2,1)
          @game_board.print_case
        else
          @game_board.check(2,2,2)
          @game_board.print_case
        end
      else
       puts "case deja prise, ça passe ton tour"
      end
      end  
end

end 