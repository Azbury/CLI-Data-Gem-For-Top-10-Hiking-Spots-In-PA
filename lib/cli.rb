class CLI
  def self.call
    HikingSpot.new_from_list
    puts "Welcome to the Top 10 Hiking Spots in Pennsalvania."
    CLI.start
  end

  def self.start
    CLI.print_hikingspot_titles
  end

  def self.print_hikingspot_titles
    HikingSpot.all.each {|hikingspot| puts hikingspot.title}
  end
end
