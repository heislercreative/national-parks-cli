# CLI Controller
class NationalParks::CLI

  def call
    list_states
    state_menu
    goodbye
  end

  # State Methods #
  def list_states
    puts "Welcome to the National Park Service!"
    @states = NationalParks::State.all
    @states.each.with_index(1) {|state, i| puts "#{i}. #{state.name}"}
  end

  def state_menu
    puts "Please pick a US state or territory by number."
    puts "  Type 'states' to return to the state list."
    puts "  Type 'exit' to leave."
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        list_parks
        #puts @states[input.to_i-1]
      elsif input == "states"
        list_states
      else
        puts "Please select a valid state or territory."
      end
    end
  end
  
  # Park Methods #
  def list_parks
    @parks = NationalParks::Park.all
    @parks.each.with_index(1) {|park, i| puts "#{i.} #{park.name}"}
  end

  def goodbye
    puts "Hope to see you again soon!"
  end

end
