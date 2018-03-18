class NationalParks::State
  attr_accessor :name, :url
  @@states = []

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.all
    @@states
  end

  def self.scrape_states
    #Scrape state index page and return state names & urls
    states_page = Nokogiri::HTML(open("https://www.nps.gov/findapark/index.htm"))

    state_list = states_page.css('area')
    state_list.each do |state|
      state_name = "#{state.attr("alt")}"
      state_url = "#{state.attr("href")}"
      state = self.new(name = state_name, url = state_url)

      @@states << state
    end

  @@states.sort_by!{|s| s.name}
  @@states.delete_at(4)  #Remove duplicate Arkansas entry
  @@states
  end

end
