class CLI
  def self.call
    HikingSpot.new_from_list
    puts "Welcome to the Top 10 Hiking Spots in Pennsalvania."
    CLI.start
  end

  def self.start
    puts "These are the top 10 Hiking Spots in PA listed in order from number 1 to 10."
    CLI.print_hikingspot_titles
  end

  def self.print_hikingspot_titles
    HikingSpot.all.each {|hikingspot| puts hikingspot.title}
  end
end
