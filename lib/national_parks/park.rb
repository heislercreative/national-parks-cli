class NationalParks::Park
  attr_accessor :name, :type, :location, :description

  def self.all
    #Scrape state parks page and return park names, types, locations, & descriptions
    self.scrape_parks
  end

end
