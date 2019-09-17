require 'nokogiri'
require 'open-uri'
require 'pry'

module Top10HikingSpots
  class Error < StandardError; end
end

require_relative 'top_10_hiking_spots/cli'
require_relative 'top_10_hiking_spots/hikingspot'
require_relative 'top_10_hiking_spots/scraper'
