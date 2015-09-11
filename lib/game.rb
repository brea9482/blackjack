class Game
  attr_reader :deck

  def initialize
    @deck = Hand.new
  end

  def start
    deck.initial_deal
    puts "Player was dealt a #{deck.player_hand[0].rank} of #{deck.player_hand[0].suit} and #{deck.player_hand[1].rank} of #{deck.player_hand[1].suit}"
  end

  def player_result
    if deck.count("player_hand") > 21
      puts "Your hand is busted!"
    elsif deck.count("player_hand") == 21
      puts "BlackJack!!"
      abort
    else
      print "Would you like to draw another card (Y/N)? "
    end
  end

  def player_choices(iteration)
    deck.player_deal
    puts "\nPlayer has received additional card #{deck.player_hand[iteration].rank} of #{deck.player_hand[iteration].suit}\n\n"
    deck.count("player_hand")
    player_result
  end

  def game_wrapup
    if deck.count("player_hand") < 21
      until deck.count("dealer_hand") >= 17
        deck.dealer_deal
      end
      if deck.count("dealer_hand") > 21
        puts "Dealer score is: #{deck.count("dealer_hand")}"
        puts "Player score is: #{deck.count("player_hand")}"
        puts "\nDealer has busted, player wins!"
      else
        puts ""
        deck.dealer_hand.each do |card|
          puts "Dealer was dealt #{card.rank} of #{card.suit}."
       end

       if deck.count("player_hand") > deck.count("dealer_hand")
         puts "Player wins! :)"
         puts ""
         puts "Dealer score is: #{deck.count("dealer_hand")}"
         puts "Player score is: #{deck.count("player_hand")}"
       elsif deck.count("player_hand") == deck.count("dealer_hand")
         puts "Game ends in a tie"
         puts ""
         puts "Dealer score is: #{deck.count("dealer_hand")}"
         puts "Player score is: #{deck.count("player_hand")}"
       else
         puts "Dealer wins :("
         puts ""
         puts "Dealer score is: #{deck.count("dealer_hand")}"
         puts "Player score is: #{deck.count("player_hand")}"
       end
      end
    end
  end
end
