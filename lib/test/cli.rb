require "test/cli/version"

class Test::CLI

  def call
    Test::Scraper.new.create_actor
    puts "Welcome to the Oscars Awards"
    start
  end

  def start
    puts ""
    print_actor_list(actor)
    
    puts ""
    
    puts "Which actor would you like to view the year, character and movie that they won an Oscar for?"
    input = gets.strip.to_i
    
    actor = Test::Actor.find(input)

    print_actor_info(actor)

    puts ""
    puts "Would you like to see another actor's information? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    elsif input == "n"
      puts ""
      puts "Thank you! Have a great day!"
      exit
    else
      puts ""
      puts "I don't understand that answer."
      start
    end
  end

  def print_restaurant(restaurant)
    puts ""
    puts "----------- #{restaurant.name} - #{restaurant.position} -----------"
    puts ""
    puts "Location:           #{restaurant.location}"
    puts "Head Chef:          #{restaurant.head_chef}"
    puts "Style of Food:      #{restaurant.food_style}"
    puts "Standout Dish:      #{restaurant.best_dish}"
    puts "Contact:            #{restaurant.contact}"
    puts "Website:            #{restaurant.website_url}"
    puts ""
    puts "---------------Description--------------"
    puts ""
    puts "#{restaurant.description}"
    puts ""
  end

  def print_actor_list(from_number)
    puts ""
    puts "---------- Restaurants #{from_number} - #{from_number+9} ----------"
    puts ""
    WorldsBestRestaurants::Restaurant.all"
    end
  end

end
