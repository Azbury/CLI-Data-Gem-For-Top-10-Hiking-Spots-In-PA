class CLI
  def self.call
    HikingSpot.new_from_list
    puts "Welcome to the Top 10 Hiking Spots in Pennsalvania."
    CLI.start
  end

  def self.start
    puts "These are the top 10 Hiking Spots in PA listed in order from number 1 to 10."
    puts ""
    CLI.print_hikingspot_titles
    puts ""
    puts "Type in the title of hiking spot if you would like to see a description of a specific hiking spot."
  end

  def self.print_hikingspot_titles
    HikingSpot.all.each {|hikingspot| puts hikingspot.title}
  end

  def self.print_hikingspot_description (title)
    HikingSpot.all.detect {|hikingspot| hikingspot.title == title}
  end
end
