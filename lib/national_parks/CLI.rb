# CLI Controller
class NationalParks::CLI

  def call
    puts "Welcome to the National Park Service!"
    list_parks
  end

  def list_parks
    puts <<-DOC
      1. Alabama
      2. Alaska
    DOC
  end

end
