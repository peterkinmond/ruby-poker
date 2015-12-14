class Game

  def initialize
    @players = []
    @winning_player = nil
    @pot = 0
    @deck = Deck.new
    @community_cards = []
  end

  def start
    puts "New game starting..."
    add_players
    # TODO: Separate overall Game from single hand of play
    prepare_deck
    deal_hole_cards
    show_player_cards
    betting_round("pre-flop")
    deal_community_cards("The Flop", 3)
    betting_round("post-flop")
    deal_community_cards("The Turn", 1)
    betting_round("post-turn")
    deal_community_cards("The River", 1)
    betting_round("das final")
    #finish
  end

  private

  #def finish
    ## Players show cards
    #@players.each do |player|
      #puts player.cards.inspect
    #end

    ## Figure out winner
    #@players.each do |player|
      #figure_out_best_hand(player)
    #end

    ## Give pot to winner

    ## Announce winner total
    #puts "The winner is #{@winning_player}"
  #end

  def figure_out_best_hand(player)
    total_cards = player.cards + @community_cards
    total_cards.combination(5).each do |combo|
      combo_ranking = HandRankings.get_rank(combo)
      if combo_ranking > player.hand_ranking
        player.hand_ranking = combo_ranking
      end
    end
  end

  def deal_community_cards(round_name, amount)
    puts ""
    puts "Dealing #{round_name}"
    amount.times do |t|
      card = @deck.deal_card
      puts "Next card is: #{card.inspect}"
      @community_cards << card
    end
  end

  def betting_round(round_name)
    puts "Starting betting for #{round_name}"
    @players.each do |player|
      # TODO: Allow checking/folding
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
