#Class HikingSpot
#Objects to store the data that is scraped using the class Scraper
#stores the hiking spots title and description and maintains and array of all the
#instaces of HikingSpots
class HikingSpot

  #class variable to store all instances of the objects HikingSpot
  @@all = []

  #accessors for the title and description variable for a HikingSpot object.
  attr_accessor :title, :description

  #initialize
  #constructor for HikingSpot objects
  #takes in a title and description
  def initialize (title, description)
    @title = title
    @description = description
    @@all << self
  end

  #all
  #class method for retrieving all instaces of HikingSpot
  def self.all
    @@all
  end

  #new_from_list
  #Class method for creating HikingSpot objects from data scraped in the class
  #Scraper.
  def self.new_from_list
    titles = Scraper.scrape_spot_titles
    descriptions = Scraper.scrape_spot_descriptions
    titles.each_with_index do |title, i|
      HikingSpot.new(title, descriptions[i])
    end
  end

end
