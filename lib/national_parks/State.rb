class NationalParks::State
  attr_accessor :name, :url

  def self.all
    #Scrape state index page and return state names & urls
    self.scrape_states
  end

  def self.scrape_states
    states = []

    states_page = Nokogiri::HTML(open("https://www.nps.gov/findapark/index.htm"))

    state_list = states_page.css('area')
    state_list.each do |state|
      state_name = "#{state.attr("alt")}"
      state_url = "#{state.attr("href")}"
      
      states << {name: state_name, url: state_url}
    end
    # state_1 = self.new
    # state_1.name = "Alabama"
    # state_1.url = "/state/al/index.htm"
    #
    # state_2 = self.new
    # state_2.name = "Alaska"
    # state_2.url = "/state/ak/index.htm"

  states.sort_by!{|s| s[:name]}
  states
  end

end
