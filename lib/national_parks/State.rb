class NationalParks::State

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Alabama
      2. Alaska
    DOC
    state_1 = self.new
    state_1.name = "Alabama"
    state_1.url = "https://www.nps.gov/state/al/index.htm"

    state_2 = self.new
    state_2.name = "Alaska"
    state_2.url = "https://www.nps.gov/state/ak/index.htm"

    [state_1, state_2]
  end

end
