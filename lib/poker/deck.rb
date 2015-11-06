class Deck
  SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds']
  NUMBERS = (2..14) # 11 = J, 12 = Q, 13 = K, 14 = A

  attr_reader :cards

  def initialize
    create_cards
  end

  def create_cards
    @cards = []
    SUITS.each do |suit|
      NUMBERS.each do |number|
        @cards << Card.new(number, suit)
      end
    end
  end

  def shuffle
    @cards = @cards.shuffle
  end
end
