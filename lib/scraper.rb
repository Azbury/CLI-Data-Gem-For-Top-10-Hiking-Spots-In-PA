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

  #scrape_titles_and_descriptions
  #Class method that uses the .css method from Nokogiri to retrieve the utems
  #based on the class tag on the website. Then using the .css method again to
  #eliminate all the items that do not have a title class tag. After that the method
  #will use the .css method again to scrape the title and description and store them
  #in seperate arrays for each title and description and will finally store each of
  #those individual arrays in a larger array which will get returned at the end.
  def self.scrape_titles_and_descriptions
    articles_array = []
    items = self.get_page.css("div#gallery-1 .gallery-item")
    articles = items.select{|item| item.css("figcaption.gallery-caption").count != 0}
    articles.each do |article|
      article_array = []
      article_array << article.css("figcaption.gallery-caption").text
      article_array << article.css("div.gallery-description").text
      articles_array << article_array
    end
    articles_array
  end

end
