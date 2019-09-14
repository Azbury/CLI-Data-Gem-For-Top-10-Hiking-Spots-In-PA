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
    puts "Type in a number between 1-10 if you would like to see a description of a specific hiking spot."
    input = gets.strip
    CLI.print_hikingspot_description(input)
  end

  def self.print_hikingspot_titles
    HikingSpot.all.each {|hikingspot| puts hikingspot.title}
  end

  def self.print_hikingspot_description (number)
    hikingspot = HikingSpot.all.detect {|hikingspot| hikingspot.title.include?(number)}
    puts hikingspot.description
  end
end
