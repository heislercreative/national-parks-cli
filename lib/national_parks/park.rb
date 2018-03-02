class NationalParks::Park
  attr_accessor :name, :type, :location, :description

  def self.state_name(state_url)
    parks_page = Nokogiri::HTML(open(state_url)) #replace with interpolated state url
    @state_name = parks_page.css("h1.page-title").text.upcase
  end

  def self.all
    #Scrape state parks page and return park names, types, locations, & descriptions
    self.scrape_parks
  end

  def self.scrape_parks
    parks = []

    parks_page = Nokogiri::HTML(open("https://www.nps.gov/state/co/index.htm")) #replace with interpolated state url

    park_list = parks_page.css("div.col-md-9.col-sm-9.col-xs-12.table-cell.list_left")

    park_list.each do |park|
      park_type = park.css("h2").text
      park_name = park.css("h3").text
      park_location = park.css("h4").text
      park_description = park.css("p").text

      parks << {name: park_name, type: park_type, location: park_location, description: park_description}
    end

    parks
  end

end
