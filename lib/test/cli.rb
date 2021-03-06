class Test::CLI

  def call
    Test::Scraper.create_actor
    puts "Welcome to the Oscars Awards"
    start
  end

  def start
    puts ""
    print_actor_list
    
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

  def print_actor_info(actor)
    puts ""
    puts "#{actor.name}"
    puts ""
    puts "#{actor.role}"
    puts ""
  end

  def print_actor_list
    puts ""
    actor = Test::Actor.all
    actor.each.with_index(1) {|actor, index| puts "#{index}. #{actor.year}"}
    puts " "
  end

end
