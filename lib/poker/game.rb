class Game

  def initialize
    @players = []
    @pot = 0
    @deck = Deck.new
    @community_cards = []
    puts "New game starting..."
    game_flow
  end

  def game_flow
    add_players
    # TODO: Separate overall Game from single hand of play
    prepare_deck
    deal_hole_cards
    show_player_cards
    pre_flop_betting
    deal_the_flop
    post_flop_betting
    #deal_the_turn
    #post_turn_betting
    #deal_the_river
    #final_betting
    #cleanup
  end

  private

  def deal_the_flop
    3.times do |t|
      card = @deck.deal_card
      puts "Next card is: #{card.inspect}"
      @community_cards << card
    end
  end

  def post_flop_betting
    puts "Ready for post-flop betting? (Press enter)"
    gets
    @players.each do |player|
      puts "#{player.name}: how much do you bet?"
      bet = gets.chomp.to_i
      @pot += bet
      player.money = player.money - bet
      puts "#{player.name}: has $#{player.money} remaining"
      puts "Pot is now: $#{@pot}"
    end
  end

  def pre_flop_betting
    puts "Ready for pre-flop betting? (Press enter)"
    gets
    @players.each do |player|
      puts "#{player.name}: how much do you bet?"
      bet = gets.chomp.to_i
      @pot += bet
      player.money = player.money - bet
      puts "#{player.name}: has $#{player.money} remaining"
      puts "Pot is now: $#{@pot}"
    end
  end

  def add_players
    puts "How many players?"
    number_of_players = gets.chomp.to_i
    counter = 1
    number_of_players.times do |player|
      @players << Player.new("Player" + (counter).to_s)
      counter += 1
    end
  end

  def prepare_deck
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
