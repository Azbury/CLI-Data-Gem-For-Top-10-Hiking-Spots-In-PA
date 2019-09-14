#CLI
#class for storing all the information needed for the CLI.
#Call on methods within the HikingSpot class to retrieve information for the CLI.
class CLI

  #call
  #class method for making the initial call to the CLI class.
  def self.call
    HikingSpot.new_from_list
    puts "Welcome to the Top 10 Hiking Spots in Pennsalvania."
    CLI.start
  end

  #start
  #class method for running through the program.
  def self.start
    puts "These are the top 10 Hiking Spots in PA listed in order from number 1 to 10."
    puts ""
    CLI.print_hikingspot_titles
    puts ""
    puts "Type in a number between 1-10 if you would like to see a description of a specific hiking spot."
    input = gets.strip
    CLI.print_hikingspot_description(input)
  end

  #print_hikingspot_titles
  #class method for print_hikingspot_titles from hikingspot class.
  def self.print_hikingspot_titles
    HikingSpot.all.each {|hikingspot| puts hikingspot.title}
  end

  #print_hikingspot_description
  #class method for printing_hikingspot_description based on the number associated with
  #the title.
  def self.print_hikingspot_description (number)
    hikingspot = HikingSpot.all.detect {|hikingspot| hikingspot.title.include?(number)}
    puts hikingspot.description
  end

end
