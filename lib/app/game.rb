class Game

  attr_accessor :players, :board

  def initialize
    @players = []
    @board = Board.new
  end

  # Fonction qui demande le nom des 2 joueurs
  def ask_name
    puts "Nom du player 1 ?"
    print "> "
    @players << Player.new(gets.chomp.to_s, "o")

    puts "Nom du player 2 ?"
    print "> "
    @players << Player.new(gets.chomp.to_s, "x")
  end

  # Fonction qui fait jouer les joueurs un par un
  def select_player
    while @board.game_state_variable == false
      @players.each { |item| choose_case(item) }
    end
  end


  def choose_case (player)

    if @board.game_state_variable == true
      puts "Bravo #{player.name}!! Tu as gagné !!"

    elsif @board.game_nil_variable == true
      puts "la partie est finie, partie nul!!"

    else
      puts "#{player.name} avec le symbole '#{player.symbol}' à toi de jouer entre la case que tu souhaites. Exemple : a1, b2, c3..."
      print "> "
      @board.write_on_case(gets.chomp.to_s, player.symbol)
      @board.show_board
      @board.game_state
    end
  end

  # fontion qui demande au joueur s'il veut rejouer
  def ask_new_game
    puts "Tape rejouer si tu veux 'rejouer' au morpion ! Ou n'import quel charactère pour sortir "
    print "> "
    new_game = gets.chomp.to_s

    if new_game == "rejouer"
      # remettre le jeu avec tableau vide
      @board.array_cases.map! { |item| item.content = " " }
      # appeler self.perfom pour jouer a nouveau
      self.perform
    end
  end

  def perform
    ask_name
    puts "Le nom du joueur 1 est #{@players[0].name} et son symbole est #{@players[0].symbol}"
    puts "Le nom du joueur 2 est #{@players[1].name} et son symbole est #{@players[1].symbol}"
    # afficher un tableau vide
    @board.show_board
    select_player
    ask_new_game
  end
end
