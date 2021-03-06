class NationalParks::Park
  attr_accessor :name, :type, :location, :description
    @@all = []

  def initialize(name, type, location, description)
    @name = name
    @type = type
    @location = location
    @description = description
  end

  def self.state_name(state_url)
    parks_page = Nokogiri::HTML(open(state_url)) #replace with interpolated state url
    @state_name = parks_page.css("h1.page-title").text.upcase
  end

  def self.all(state_url)
    #Scrape state parks page and return park names, types, locations, & descriptions

    self.scrape_parks(state_url)
  end

  def self.scrape_parks(state_url)
    parks_page = Nokogiri::HTML(open(state_url))

    park_list = parks_page.css("div.col-md-9.col-sm-9.col-xs-12.table-cell.list_left")

    park_list.each do |park|
      park_type = park.css("h2").text
      park_name = park.css("h3").text
      park_location = park.css("h4").text
      park_description = park.css("p").text
      park = self.new(name = park_name, type = park_type, location = park_location, description = park_description)

      @@all.find {|p| p.name == park.name} || @@all << park
    end
    @@all
  end

end
