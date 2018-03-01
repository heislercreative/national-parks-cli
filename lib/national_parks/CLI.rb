# CLI Controller
class NationalParks::CLI

  def call
    list_states
    state_menu
    goodbye
  end

  def list_states
    puts "Welcome to the National Park Service!"
    @states = NationalParks::State.all
  end

  def state_menu
    puts "Please pick a US state or territory by number."
    puts "  Type 'states' to return to the state list."
    puts "  Type 'exit' to leave."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @states[input.to_i-1]
      elsif input == "states"
        list_states
      else
        puts "Please select a valid state or territory."
      end
    end
  end

  def goodbye
    puts "Hope to see you again soon!"
  end

end
