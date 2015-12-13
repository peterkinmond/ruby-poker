class Game

  def initialize
    puts "New game starting..."

    add_players
    prepare_pot
    prepare_deck
    deal_hole_cards
    show_player_cards
  end

  private

  def add_players
    puts "How many players?"
    number_of_players = gets.chomp.to_i
    @players = []
    counter = 1
    number_of_players.times do |player|
      @players << Player.new("Player" + (counter).to_s)
      counter += 1
    end
  end

  def prepare_pot
    @pot = 0
  end

  def prepare_deck
    @deck = Deck.new
    @deck.shuffle
  end

  def deal_hole_cards
    2.times do |t|
      @players.each do |player|
        player.cards << @deck.deal_card
      end
    end
  end

  def show_player_cards
    @players.each do |player|
      puts "Ready to see cards for player #{player.name}? (Enter 'y' for yes)"
      response = gets.chomp
      if response == 'y'
        puts player.cards.inspect
      end
    end
  end

end
