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

  states.sort_by!{|s| s[:name]}
  states.delete_at(4)  #Remove duplicate Arkansas entry
  states
  end

end
