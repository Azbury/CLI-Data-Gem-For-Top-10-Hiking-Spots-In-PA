class HikingSpot
  @@all = []

  attr_accessor :title, :description

  def initialize (title, description)
    @title = title
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_from_list
    titles = Scraper.scrape_spot_titles
    descriptions = Scraper.scrape_spot_descriptions
    titles.each_with_index do |title, i|
      HikingSpot.new(title, descriptions[i - 1])
    end
  end
end
