class HandRankings

  Rank = Struct.new(:value, :name)

  # 10 Royal Flush
  # 9 Straight Flush
  # 8 Four of a Kind
  # 7 FUll House
  # 6 Flush
  # 5 Straight
  # 4 THree of a Kind
  # 3 Two Pair
  # 2 One Pair
  # 1 High Card

  def self.get_rank(card1, card2, card3, card4, card5)
    Rank.new(10, "Royal Flush")
  end

end
