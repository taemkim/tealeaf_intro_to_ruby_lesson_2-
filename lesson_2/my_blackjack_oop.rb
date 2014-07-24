
  CALC = { "Ace of Clubs" => 1, "2 of Clubs" => 2, "3 of Clubs" => 3, "4 of Clubs" => 4, "5 of Clubs" => 5,
       "6 of Clubs" => 6, "7 of Clubs" => 7, "8 of Clubs" => 8, "9 of Clubs" => 9, "10 of Clubs" => 10,
       "Jack of Clubs" => 10, "Queen of Clubs" => 10, "King of Clubs" => 10,
       "Ace of Diamonds" => 1, "2 of Diamonds" => 2, "3 of Diamonds" => 3, "4 of Diamonds" => 4, "5 of Diamonds" => 5,
       "6 of Diamonds" => 6, "7 of Diamonds" => 7, "8 of Diamonds" => 8, "9 of Diamonds" => 9, "10 of Diamonds" => 10,
       "Jack of Diamonds" => 10, "Queen of Diamonds" => 10, "King of Diamonds" => 10,
       "Ace of Hearts" => 1, "2 of Hearts" => 2, "3 of Hearts" => 3, "4 of Hearts" => 4, "5 of Hearts" => 5,
       "6 of Hearts" => 6, "7 of Hearts" => 7, "8 of Hearts" => 8, "9 of Hearts" => 9, "10 of Hearts" => 10,
       "Jack of Hearts" => 10, "Queen of Hearts" => 10, "King of Hearts" => 10,
       "Ace of Spades" => 1, "2 of Spades" => 2, "3 of Spades" => 3, "4 of Spades" => 4, "5 of Spades" => 5,
       "6 of Spades" => 6, "7 of Spades" => 7, "8 of Spades" => 8, "9 of Spades" => 9, "10 of Spades" => 10,
       "Jack of Spades" => 10, "Queen of Spades" => 10, "King of Spades" => 10
    }

class Table

  attr_accessor :player_card_value_adj, :dealer_card_value_adj, :player_cards, :dealer_cards

  def initialize
    @deck = ["Ace of Clubs", "2 of Clubs", "3 of Clubs", "4 of Clubs", "5 of Clubs", 
       "6 of Clubs", "7 of Clubs", "8 of Clubs", "9 of Clubs", "10 of Clubs", 
       "Jack of Clubs", "Queen of Clubs", "King of Clubs",
       "Ace of Diamonds", "2 of Diamonds", "3 of Diamonds", "4 of Diamonds", "5 of Diamonds", 
       "6 of Diamonds", "7 of Diamonds", "8 of Diamonds", "9 of Diamonds", "10 of Diamonds", 
       "Jack of Diamonds", "Queen of Diamonds", "King of Diamonds",
       "Ace of Hearts", "2 of Hearts", "3 of Hearts", "4 of Hearts", "5 of Hearts", 
       "6 of Hearts", "7 of Hearts", "8 of Hearts", "9 of Hearts", "10 of Hearts", 
       "Jack of Hearts", "Queen of Hearts", "King of Hearts",
       "Ace of Spades", "2 of Spades", "3 of Spades", "4 of Spades", "5 of Spades", 
       "6 of Spades", "7 of Spades", "8 of Spades", "9 of Spades", "10 of Spades", 
       "Jack of Spades", "Queen of Spades", "King of Spades"
    ]
    @player_cards = []
    @dealer_cards = []
    @player_card_value_min = 0
    @player_card_value_adj = 0
    @dealer_card_value_min = 0    
    @dealer_card_value_adj = 0
  end
  
  def deal_player_initial_cards
    2.times do
      @player_cards << @deck.sample
      @deck.delete(@player_cards.last)
    end
  end

  def calculate_player_initial_cards
    @player_cards.each do |card|  
      @player_card_value_min = @player_card_value_min + CALC[card]
    end
    
    if @player_card_value_min <= 11 && 
        (@player_cards.include?("Ace of Clubs") || 
        @player_cards.include?("Ace of Diamonds") ||
        @player_cards.include?("Ace of Hearts") ||
        @player_cards.include?("Ace of Spades"))
      @player_card_value_adj = @player_card_value_min + 10
    else
      @player_card_value_adj = @player_card_value_min
    end

  end

  def deal_dealer_initial_cards
    2.times do
      @dealer_cards << @deck.sample
      @deck.delete(@dealer_cards.last)
    end
  end

  def calculate_dealer_initial_cards
    @dealer_cards.each do |card|  
      @dealer_card_value_min = @dealer_card_value_min + CALC[card]
    end

    if @dealer_card_value_min <= 11 && 
        (@dealer_cards.include?("Ace of Clubs") || 
        @dealer_cards.include?("Ace of Diamonds") ||
        @dealer_cards.include?("Ace of Hearts") ||
        @dealer_cards.include?("Ace of Spades"))
      @dealer_card_value_adj = @dealer_card_value_min + 10
    else
      @dealer_card_value_adj = @dealer_card_value_min
    end

  end

  def deal_player_additional_card
    @player_cards << @deck.sample
    @deck.delete(@player_cards.last)
  end
  
  def calculate_player_additional_card 
    @player_card_value_min = @player_card_value_min + CALC[@player_cards.last]
    
    if @player_card_value_min <= 11 && 
        (@player_cards.include?("Ace of Clubs") || 
        @player_cards.include?("Ace of Diamonds") ||
        @player_cards.include?("Ace of Hearts") ||
        @player_cards.include?("Ace of Spades"))
      @player_card_value_adj = @player_card_value_min + 10
    else
      @player_card_value_adj = @player_card_value_min
    end     
  end  

  def deal_dealer_additional_card
      @dealer_cards << @deck.sample
      @deck.delete(@dealer_cards.last)
  end

  def calculate_dealer_additional_card
    @dealer_card_value_min = @dealer_card_value_min + CALC[@dealer_cards.last]
    
    if @dealer_card_value_min <= 11 && 
        (@dealer_cards.include?("Ace of Clubs") || 
        @dealer_cards.include?("Ace of Diamonds") ||
        @dealer_cards.include?("Ace of Hearts") ||
        @dealer_cards.include?("Ace of Spades"))
      @dealer_card_value_adj = @dealer_card_value_min + 10
    else
      @dealer_card_value_adj = @dealer_card_value_min
    end
  end

end

class Player

  attr_accessor :playername

  def initialize(name)
    @playername = name
  end

end

class Game
  def initialize
    @hit_or_stay = nil  
  end

  def intro
    puts "----------------------------------"
    puts "Tealeaf Blackjack OOP v1.0"
    puts "by Tae Kim"
    puts "----------------------------------"
    puts ""
    puts "What is your name?"
    @name = gets.chomp
    puts ""
    puts "Hello, #{@name}. Are you ready for some blackjack?"
    puts "(Dealer deals cards....)"
    puts ""
    puts "----------------------------------"
  end

  def ask_hit_or_stay
    puts "Hit or Stay? ('h' or 's')"
    @hit_or_stay = gets.chomp
  end

  def play
    system 'clear'
    intro
    newplayer = Player.new(@name)
    newgame = Table.new
    
    newgame.deal_player_initial_cards
    puts "#{newplayer.playername} has #{newgame.player_cards[0]} and #{newgame.player_cards[1]}."
    puts " "
    newgame.deal_dealer_initial_cards
    puts "Dealer has #{newgame.dealer_cards[0]} and Unknown(face down)."
    puts " "
    newgame.calculate_player_initial_cards
    puts "#{newplayer.playername} has #{newgame.player_card_value_adj}."
    puts " "
    newgame.calculate_dealer_initial_cards
    puts "----------------------------------"

    until newgame.player_card_value_adj > 20 || @hit_or_stay == "s"
      ask_hit_or_stay
      if @hit_or_stay == "h"
        puts " "
        puts "#{newplayer.playername} likes to live dangerously. #{newplayer.playername} chooses to hit!"
        puts " "
        newgame.deal_player_additional_card
        puts "#{newplayer.playername}'s cards are: " + [newgame.player_cards].join(" - ")
        newgame.calculate_player_additional_card
        puts "#{newplayer.playername} has #{newgame.player_card_value_adj}."
        puts " "
      elsif @hit_or_stay == "s"
        puts " "
        puts "#{newplayer.playername} stays with #{newgame.player_card_value_adj}."
        puts " "
      end
    end
    
    if newgame.player_card_value_adj > 21
      puts "Dealer doesn't draw because #{newplayer.playername} busted."
      puts "#{newplayer.playername} loses!"
    elsif newgame.player_card_value_adj == 21
      puts "Dealer doesn't draw because #{newplayer.playername} hit blackjack."
      puts "#{newplayer.playername} wins with a blackjack!"
    else
      puts "It is dealer's turn now."
      puts ""
      puts "----------------------------------"
      puts ""
      puts "Dealer reveals his second card which was facing down.  It is #{newgame.dealer_cards[1]}."
      puts "Dealer has #{newgame.dealer_card_value_adj} (#{newgame.dealer_cards[0]} and #{newgame.dealer_cards[1]})."
      puts ""

      until newgame.dealer_card_value_adj > 16
        newgame.deal_dealer_additional_card
        puts "Dealer draws another card. It is #{newgame.dealer_cards.last}."
        puts "Dealer's cards are: " + [newgame.dealer_cards].join(" - ")
        newgame.calculate_dealer_additional_card
        puts "Dealer has #{newgame.dealer_card_value_adj}."
        puts ""
      end
      
      if (newgame.player_card_value_adj < 21) && (newgame.dealer_card_value_adj > 21)
        puts "#{newplayer.playername} wins because dealer busted."
      elsif (newgame.player_card_value_adj < 21) && (newgame.player_card_value_adj > newgame.dealer_card_value_adj)
        puts "#{newplayer.playername} wins." 
      elsif (newgame.player_card_value_adj < 21) && (newgame.player_card_value_adj < newgame.dealer_card_value_adj)
        puts "#{newplayer.playername} loses." 
      else
        puts "#{newplayer.playername} and dealer ties."
      end
    end
    
    puts " "
    puts "----------------------------------"
  end
end

Game.new.play
