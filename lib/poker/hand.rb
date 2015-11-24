class Hand
  # Hand is made up of 2 hole cards
  # and 5 community cards
  # Include them in this class or add to player?

  attr_reader :cards

  def initialize(*cards)
    if cards.all?{|card| card.is_a?(Card)}
      @cards = cards
    # TODO: Add easier way of creating card hands
    #else
      #cards.each{|card_string| @cards << Card.new(card_string)}
    end
  end
end
