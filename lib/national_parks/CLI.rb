# CLI Controller
class NationalParks::CLI

  def call
    list_states
    state_menu
    goodbye
  end

  def list_states
    puts "Welcome to the National Park Service!"
    puts <<-DOC.gsub /^\s*/, ''
      1. Alabama
      2. Alaska
    DOC
    @states = NationalParks::State.all
  end

  def state_menu
    puts "Please pick a US state or territory by number."
    puts "  Type 'states' to return to the state list."
    puts "  Type 'exit' to leave."
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "1"
        puts "List of Alabama Parks"
      when "2"
        puts "List of Alaska Parks"
      when "states"
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
