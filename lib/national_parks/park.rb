class NationalParks::Park
  attr_accessor :name, :type, :location, :description

  def self.all
    #Scrape state parks page and return park names, types, locations, & descriptions
    self.scrape_parks
  end
  def self.scrape_parks
    parks = []

    parks_page = Nokogiri::HTML(open("https://www.nps.gov/state/co/index.htm")) #replace with interpolated state url
    puts parks_page
  end

end
