class Scraper
  def self.get_page
    Nokogiri::HTML(open(https://www.onlyinyourstate.com/pennsylvania/pa-hiking/))
  end

  def self.scrape_spot_titles
    spot_title_array = []
    self.class.get_page.css('.gallery-caption') {|title| spot_title_array << title}
    spot_title_array
  end


end
