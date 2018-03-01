class NationalParks::State

  def self.all
    puts <<-DOC.gsub /^\s*/, ''
      1. Alabama
      2. Alaska
    DOC
  end

end
