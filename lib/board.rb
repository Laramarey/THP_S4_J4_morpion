
class Board
  attr_accessor :case_array, :turn_count
#Optionnellement on peut aussi lui rajouter un autre sous le nom @turn_count pour compter le nombre de coups joué
  

  def initialize
    @turn_count = 0
    @case_array = []
      3.times do |row| #j'ai 3 lignes
        @case_array[row] = []

        3.times do |col| #j'ai 3 colonnes
        @case_array[row][col] = BoardCase.new 
        end
      end
  end

#dessinons le tableau , le boardcase vide
    def print_case
      puts "  1   2   3" 
      for n in 0..2 do #on commence à compter à 0
       print (65+n).chr + " " #affiche 65.chr correspond à A en ACSII donc ensuite en ajoutant n, on a B, C, 
        @case_array[n][0].print_case
        print " | "
        @case_array[n][1].print_case
        print " | "
        @case_array[n][2].print_case 
        puts
      end 
   end

#le tableau est-il libre pour cocher ou non ?quelles cases libres ?
  def is_free?(x,y)
    return @case_array[x][y].is_free? #liée à mon is_free de boardcase, si ma case a une valeur de 0 C'est libre 
    #,ici on ajoute la dimension pr un array c'est à dire une case en abscisse et en ordo, c'est considéré comme libre si en tout x de mon rang en et au même index de colonne j'ai la valeur 0 
  end

#quand rejoue le player 1?
  def player1_next? #le joueur 1 aura toujours des nombres de tours impairs
    return false if ( turn_count % 2 == 0 )
    return true
  end

#à qui le tour en fonction du nombre de tour?

  def check(x,y,new_value)
    @case_array[x][y].value_case = new_value #value.case est la variables d'instance de ma boardcase
    @turn_count = turn_count + 1 #je dis donc ici, dès que la case de mon tab prend une valeur en x et en y, c'est une nouvelle valeur, et donc on peut ajouter un tour 
  end

   def victory? # j'ai 4 schémas de victore, soit en rangée, colonne ou diagonale donc 4 conditions if
    #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
      for n in 0..2 do
        #condition si victore avec par rangée
      if @case_array[n][0].value_case == @case_array[n][1].value_case && @case_array[n][2].value_case == @case_array[n][1].value_case
        if @case_array[n][0].value_case  == 1 #ma value case ==1 veut dire X
          return 1
        elsif @case_array[n][0].value_case == 2 # si les O ont une victoire en rangée
          return 2
        end
      end
        #condition si victore avec par colonne
      if @case_array[1][n].value_case == @case_array[2][n].value_case && @case_array[0][n].value_case == @case_array[2][n].value_case
        if @case_array[0][n].value_case  == 1
          return 1
        elsif @case_array[0][n].value_case ==2
          return 2
        end
      end

        #condition si victore avec par diagonal #diagonale en partant du haut à gauche
      if @case_array[0][0].value_case == @case_array[1][1].value_case && @case_array[2][2].value_case == @case_array[1][1].value_case
        if @case_array[0][0].value_case  == 1
          return 1
        elsif @case_array[0][0].value_case ==2
          return 2
        end
      end

#condition si victore avec par diagonal# diagnonale en partant du haut à droite
      if @case_array[0][2].value_case == @case_array[1][1].value_case && @case_array[2][0].value_case == @case_array[1][1].value_case
        if @case_array[0][2].value_case  == 1
          return 1
        elsif @case_array[2][2].value_case ==2
          return 2
        end
      end
    end
      return nil
   end


  def is_over? # au max j'ai 9 tours tant que que je n'ai pas comptabilisé 9 tours max 
    return true if @turn_count == 9 || !victory?.nil?
    return false
  end 

end #fin de la classe board