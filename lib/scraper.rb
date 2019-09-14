class Scraper
  def self.get_page
    Nokogiri::HTML(open("https://www.onlyinyourstate.com/pennsylvania/pa-hiking/"))
  end

  def self.scrape_spot_titles
    spot_title_array = []
    self.get_page.css('figcaption.gallery-caption').children.each {|title| spot_title_array << title.text}
    spot_title_array
  end

  def self.scrape_spot_descriptions
    spot_description_array = []
    self.get_page.css('.gallery-description').each {|description| spot_description_array << description.text}
    spot_description_array
  end
end
