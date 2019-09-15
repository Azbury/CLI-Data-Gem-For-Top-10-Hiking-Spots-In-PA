#Class Scraper
#This class is responisble for scraping the data from the designated website
#in the class method get_page. The class will more specifically scrape the
#title of the top 10 hiking spots and their description based upon this websites
#opinion.
class Scraper

  #get_page
  #Class method the uses Nokogiri and Open-URI to retrieve the website in
  #the format of an HTML document that is organized by Nokogiri
  def self.get_page
    Nokogiri::HTML(open("https://www.onlyinyourstate.com/pennsylvania/pa-hiking/"))
  end

  #scrape_spot_titles
  #Class method that uses the .css method from Nokogiri to retrieve the titles
  #based on the class tag on the website. This method returns all the titles as
  #an array.
  def self.scrape_spot_titles
    spot_title_array = []
    self.get_page.css('figcaption.gallery-caption').children.each {|title| spot_title_array << title.text}
    spot_title_array
  end

  #scrape_spot_descriptions
  #Class method that uses the .css method from Nokogiri to retrieve the descriptions
  #based on the class tag on the webstie. This method returns all the descriptions
  #as an array.
  def self.scrape_spot_descriptions
    spot_description_array = []
    self.get_page.css('.gallery-description').each {|description| spot_description_array << description.text}
    spot_description_array
  end

end
