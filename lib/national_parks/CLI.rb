# CLI Controller
require 'pry'
class NationalParks::CLI
  BASE_PATH = "https://www.nps.gov"

  def call
    welcome
    list_states
  end

  # Greetings #
  def welcome
    puts ""
    puts "                                      /\\ "  #colorize green
    puts "                                     //\\\\"  #colorize green
    puts "Welcome to the National Park Service!" + " ||"  #colorize brown
  end

  def goodbye
    puts "Hope to see you again soon!"
    exit
  end


  # State Methods #
  def list_states
    @states = NationalParks::State.all
    @states.each.with_index(1) {|state, i| puts " #{i}. #{state[:name]}"}
    state_menu
  end

  def state_menu
    puts "Please pick a US state or territory by number."
    puts "  - Type 'exit' to leave."
    input = nil
    input = gets.strip.downcase

    if input.to_i > 0
      list_parks(input.to_i-1)
    elsif input == "exit"
      goodbye
    else
      puts "Please select a valid state or territory."
    end
  end


  # Park Methods #
  def list_parks(choice)
    @chosen_state = BASE_PATH + @states[choice][:url]

    puts "==#{NationalParks::Park.state_name(@chosen_state)}=="
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
        i = input.to_i-1
        puts ""
        puts "#{@parks[i][:name].upcase} #{@parks[i][:type].upcase}"
        puts "-#{@parks[i][:location]}-"
        puts "#{@parks[i][:description]}"
        puts ""
        puts "  - Type 'parks' to return to the parks list."
        puts "  - Type 'states' to return to the states list."
        puts "  - Type 'exit' to leave."
      elsif input == "parks"
        list_parks(choice)
      elsif input == "states"
        list_states
      elsif input == "exit"
        goodbye
      else
        puts "Please select a valid park or monument."
      end
    end
  end

end
