class NationalParks::State
  attr_accessor :name, :url

  def self.all
    #Scrape state index page and return state names & urls
    self.scrape_states
  end

  def self.scrape_states
    states = []

    doc = Nokogiri::HTML(open("https://www.nps.gov/findapark/index.htm"))

    binding.pry
    # state_1 = self.new
    # state_1.name = "Alabama"
    # state_1.url = "https://www.nps.gov/state/al/index.htm"
    #
    # state_2 = self.new
    # state_2.name = "Alaska"
    # state_2.url = "https://www.nps.gov/state/ak/index.htm"

    states
  end

end
