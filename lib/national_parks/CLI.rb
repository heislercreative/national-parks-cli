# CLI Controller
class NationalParks::CLI

  def call
    list_parks
    state_menu
  end

  def list_parks
    puts "Welcome to the National Park Service!"
    puts <<-DOC.gsub /^\s*/, ''
      1. Alabama
      2. Alaska
    DOC
  end

  def state_menu
    puts "Please pick a US state or territory by number:"
    input = gets.strip
    case input
    when "1"
      puts "List of Alabama Parks"
    when "2"
      puts "List of Alaska Parks"
    end
  end


end
