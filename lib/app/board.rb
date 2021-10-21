
class Board

  attr_accessor :array_cases, :choose_case, :game_state_variable, :game_nil_variable

  def initialize
    # Initialize les 9 BoardCase
    @A1 = BoardCase.new("a1", " ")
    @A2 = BoardCase.new("a2", " ")
    @A3 = BoardCase.new("a3", " ")
    @B1 = BoardCase.new("b1", " ")
    @B2 = BoardCase.new("b2", " ")
    @B3 = BoardCase.new("b3", " ")
    @C1 = BoardCase.new("c1", " ")
    @C2 = BoardCase.new("c2", " ")
    @C3 = BoardCase.new("c3", " ")

    @game_state_variable = false

    @game_nil_variable = false

    @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]

  end

  # Fonction qui écrit le symbole de l'utilisateur dans le cas choisi par l'utilisateur actuel
  def write_on_case (case_choose, player_symbol)
    @array_cases.map { |item| item.position == case_choose ? item.content = player_symbol  : item }
  end

  # Cette fonction vérifie chaque possibilité de gain et obtient la game_state_variable à true si elle en trouve
  def game_state

    if @A1.content == "o" && @A2.content == "o" && @A3.content == "o" || @A1.content == "x" && @A2.content == "x" && @A3.content == "x"
     @game_state_variable = true
    end

    # On test la 2ème ligne
    if @B1.content == "o" && @B2.content == "o" && @B3.content == "o" || @B1.content == "x" && @B2.content == "x" && @B3.content == "x"
     @game_state_variable = true
    end

    # On test la 3eme ligne
    if @C1.content == "o" && @C2.content == "o" && @C3.content == "o" || @C1.content == "x" && @C2.content == "x" && @C3.content == "x"
    @game_state_variable = true
    end

    # On test la première colone
    if @A1.content == "o" && @B1.content == "o" && @C1.content == "o" || @A1.content == "x" && @B1.content == "x" && @C1.content == "x"
     @game_state_variable = true
    end

    # On test le deuxième colone
    if @A2.content == "o" && @B2.content == "o" && @C2.content == "o" || @A2.content == "x" && @B2.content == "x" && @C2.content == "x"
     @game_state_variable = true
    end

    # On test la 3eme colone
    if @A3.content == "o" && @B3.content == "o" && @C3.content == "o" || @A3.content == "x" && @B3.content == "x" && @C3.content == "x"
     @game_state_variable = true
    end

    # On test la diagonale gauche
    if @A1.content == "o" && @B2.content == "o" && @C3.content == "o" || @A1.content == "x" && @B2.content == "x" && @C3.content == "x"
     @game_state_variable = true
    end

    # On test la diagonle droite
    if @A3.content == "o" && @B2.content == "o" && @C1.content == "o" || @A3.content == "x" && @B2.content == "x" && @C1.content == "x"
     @game_state_variable = true
    end

  end

  # Méthode qui vérifie si le plateau est plein de "x" et "o" pour arrêter le jeu en tant que jeu nul

  def game_nil
    @array_cases.each { |item| item.content == /[:SPACE:]/ ? @game_nil_variable = true : @game_nil_variable = false }
  end


  def show_board
    # Affiche le tableau vide à l'initialisation et obtenir une variable à chaque tour de joueur
    puts "   1   2  3"
    puts " a #{@A1.content} | #{@A2.content} | #{@A3.content}"
    puts "   ---------"
    puts " b #{@B1.content} | #{@B2.content} | #{@B3.content}"
    puts "   ---------"
    puts " c #{@C1.content} | #{@C2.content} | #{@C3.content}"

  end
end
