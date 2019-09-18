require "spec_helper"

describe "Scraper" do

  let!(:hiking_spot_array) {[["1. Hawk Mountain Sanctuary, Albany Township", "Hawk Mountain has many look-out points that offer dramatic views of the surrounding land. During migratory season, hundreds of hawks can be seen passing through on any given day. The sanctuary also acts as a rehabilitation center for injured birds."],
                               ["2. Glen Onoko Falls, Jim Thorpe", "Be careful if you decide to hike Glen Onoko-- the trail is steep and unmarked with many slippery rocks along the way to trip you up. It is well-worth the challenge, however; you will encounter one waterfall after another on your way up. Pictured above are the Chameleon Falls."],
                               ["3. Susquehannock State Forest", "The Susquehannock Trail System is an 85-mile loop trail found in Clinton and Potter counties. In it is an area of about 10 square miles that has no roads-- and one of the oldest forests in the state. Pictured is the Twin Sisters Trail."]]}

  describe ".scrape_titles_and_descriptions" do
    it "is a class method that scrapes the website ('https://www.onlyinyourstate.com/pennsylvania/pa-hiking/') and a returns an array of arrays in which each array represents one hiking spot" do
      article_array = Top10HikingSpots::Scraper.scrape_titles_and_descriptions
      expect(article_array).to be_a(Array)
      expect(article_array.first).to be_a(Array)
      expect(article_array.first[0]).to match(hiking_spot_array.first[0])
      expect(article_array[0]).to match(hiking_spot_array[0])
      expect(article_array[1]).to match(hiking_spot_array[1])
      expect(article_array[2]).to match(hiking_spot_array[2])
    end
  end
end
