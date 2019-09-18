require "spec_helper"

describe "HikingSpot" do
  let!(:hiking_spot_array) {[["1. Hawk Mountain Sanctuary, Albany Township", "Hawk Mountain has many look-out points that offer dramatic views of the surrounding land. During migratory season, hundreds of hawks can be seen passing through on any given day. The sanctuary also acts as a rehabilitation center for injured birds."],
                               ["2. Glen Onoko Falls, Jim Thorpe", "Be careful if you decide to hike Glen Onoko-- the trail is steep and unmarked with many slippery rocks along the way to trip you up. It is well-worth the challenge, however; you will encounter one waterfall after another on your way up. Pictured above are the Chameleon Falls."],
                               ["3. Susquehannock State Forest", "The Susquehannock Trail System is an 85-mile loop trail found in Clinton and Potter counties. In it is an area of about 10 square miles that has no roads-- and one of the oldest forests in the state. Pictured is the Twin Sisters Trail."]]}

  let!(:hiking_spot) {Top10HikingSpots::HikingSpot.new("5. Raccoon Creek State Park, Beaver County", "You can enjoy almost any outdoor activity you might desire here, at what is one of Pennsylvania's most popular state parks. Besides a network of hiking trails and rivers, the park includes Raccoon Lake where visitors swim, fish, and boat.")}

  after(:each) do
    Top10HikingSpots::HikingSpot.class_variable_set(:@@all, [])
  end

  describe "#new" do
    it "takes in two arguments of a title and a description and sets that new hiking spot's attributes using the arguments passed in." do
      expect{Top10HikingSpots::HikingSpot.new("4. Golden Eagle Trail", "Coming in at just under ten miles, this hike is great if you want to dedicate an entire day to an adventure.")}.to_not raise_error
      expect(hiking_spot.title).to eq("5. Raccoon Creek State Park, Beaver County")
      expect(hiking_spot.description).to eq("You can enjoy almost any outdoor activity you might desire here, at what is one of Pennsylvania's most popular state parks. Besides a network of hiking trails and rivers, the park includes Raccoon Lake where visitors swim, fish, and boat.")
    end

    it "adds that new hiking spot to the HikingSpot's class collection of all existing hiking spots, stored in the `@@all` class variable." do
      expect(Top10HikingSpots::HikingSpot.class_variable_get(:@@all).first.title).to eq("5. Raccoon Creek State Park, Beaver County")
    end
  end

  describe ".new_from_list" do
    it "uses the Scraper class to create new hiking spots with the correct title and description." do
      Top10HikingSpots::HikingSpot.class_variable_set(:@@all, [])
      Top10HikingSpots::HikingSpot.new_from_list
      expect(Top10HikingSpots::HikingSpot.class_variable_get(:@@all).first.title).to eq("1. Hawk Mountain Sanctuary, Albany Township")
    end
  end

  describe '.all' do
    it 'returns the class variable @@all' do
      Top10HikingSpots::HikingSpot.class_variable_set(:@@all, [])
      expect(Top10HikingSpots::HikingSpot.all).to match_array([])
    end
  end
end
