#Class HikingSpot
#Objects to store the data that is scraped using the class Scraper
#stores the hiking spots title and description and maintains and array of all the
#instaces of HikingSpots
class Top10HikingSpots::HikingSpot

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
    articles = Top10HikingSpots::Scraper.scrape_titles_and_descriptions
    articles.each do |article|
      #article[0] is the title, article[1] is the description
      self.new(article[0], article[1])
    end
  end

end
