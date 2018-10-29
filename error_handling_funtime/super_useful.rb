# PHASE 2
def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    return nil
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
  def message
    puts "THIS IS NOT A FRUIT!"
  end
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise CoffeeError
  end
end

def feed_me_a_fruit
  begin
    puts "Hello, I am a friendly monster. :)"

    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    print e.message
    retry
  end
end

# PHASE 4
class BestFriend

  # begin
  #   initialize(name, yrs_known, fav_pastime)
  # rescue DescriptiveError
  #   raise "yrs_known has to be at least 5 years"
  # end

  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise "YOU GUYS NEED TO HAVE KNOWN MORE THAN FIVE YEARS TO BE BESTIES!" 
    end

    if name.length <= 0 || fav_pastime.length <= 0
      raise "GIVE US NAME/FAV PASTTIME"
    end

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
