# CLI Controller
require 'colorize'

class NationalParks::CLI
  BASE_PATH = "https://www.nps.gov"

  # Basic Run #
  def call
    welcome
    list_states
  end


  # Greetings #
  def welcome
    puts ""
    puts "                                      /\\ ".colorize(:green)
    puts "                                     //\\\\".colorize(:green)
    puts "Welcome to the National Park Service!" + " ||".colorize(:black)
  end

  def goodbye
    puts ""
    puts "  Hope to see you again soon!"
    puts ""
    exit
  end


  # State Methods #
  def list_states
    @states = NationalParks::State.all
    puts ""
    @states.each.with_index(1) {|state, i| puts " #{i}. #{state[:name]}"}
    state_menu
  end

  def state_menu
    puts "Please pick a US state or territory by number."
    puts "  - Type 'exit' to leave."
    input = nil

    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        @state_i = input.to_i-1
        list_parks(@state_i)
      elsif input == "exit"
        goodbye
      else
        puts "Please select a valid state or territory."
      end
    end
  end


  # Park Methods #
  def list_parks(choice)
    @chosen_state = BASE_PATH + @states[choice][:url]

    puts ""
    puts "==".colorize(:green) + "#{NationalParks::Park.state_name(@chosen_state)}" + "==".colorize(:green)
    @parks = NationalParks::Park.all(@chosen_state)
    @parks.each.with_index(1) {|park, i| puts " #{i}. #{park[:name]}"}
    park_menu
  end

  def park_menu
    puts "Please pick a park or monument by number for more information."
    puts "  - Type 'states' to return to the states list."
    puts "  - Type 'exit' to leave."

    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        @i = input.to_i-1
        dislay_parks
      elsif input == "parks"
        list_parks(@state_i)
      elsif input == "states"
        list_states
      elsif input == "exit"
        goodbye
      else
        puts "Please select a valid park or monument."
      end
    end
  end

  def dislay_parks
    puts ""
    puts "==================================================".colorize(:yellow)
    puts ""
    puts "#{@parks[@i][:name].upcase} #{@parks[@i][:type].upcase}"
    puts "-#{@parks[@i][:location]}-"
    puts "#{@parks[@i][:description]}"
    puts ""
    puts "  - Type 'parks' to return to the parks list."
    puts "  - Type 'states' to return to the states list."
    puts "  - Type 'exit' to leave"
  end

end
