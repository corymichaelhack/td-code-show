# show.rb
require 'date'
require './nominee'
require './invention'
require './award'

class ShowBuildFail < StandardError; end
class EmptyNomineesError < StandardError; end
class EmptyAwardsError < StandardError; end

class Show
  attr_accessor :name, :description, :date

  def initialize(name, description)
    @name = name
    @description = description
    @date = Time.new(2022,12,31)
    @nominees = []
    @awards = []
  end

  def add_nominee(nominee)
    @nominees << nominee
  end

    def add_award(award)
    @awards << award
  end

  def list_nominees
    puts "Your nominees are:"
    @nominees.each do |nominee|
      puts "#{nominee.name},  #{nominee.title} for #{nominee.list_inventions}"
    end
  end

  def list_awards
    puts "\nThe awards being presented today:"
    @awards.each do |award|
      puts "#{award.title}: #{award.description}"
    end
  end

  def build
    puts "Let's build the #{@date.strftime("%Y")} #{@name} show. #{@description} \n\n"
    puts "Your show includes:"
    
    raise EmptyNomineesError, "You can't have an awards show without nominees." if @nominees.empty?
    raise EmptyAwardsError, "You can't have an awards show without awards." if @awards.empty?
    
    puts "#{@nominees.size} nominees"
    puts "#{@awards.size} awards"

    return true
  end

  def is_build_complete?
    self.build ? true : false  
  end

  def start
    if is_build_complete? 
      puts "Let's start the show!! \n\n"
      list_nominees
      list_awards
    else
      raise ShowBuildFail, "Show failed to build"
    end
  end

  def conclude
    puts "\nThat's our show. Thanks for coming and now it's time to 🎉 🕺 🎤"
  end
end

# create show
show = Show.new("TD Patent Awards", "The best patent awards show in the world!")

# create nominees
nominee1 = Nominee.new("Jeremy", "Super Enigneer")
nominee2 = Nominee.new("Cory", "Enigneer")
nominee3 = Nominee.new("Steve", "Design Enigneer")

# create inventions and add to nominee
nominee1.add_invention("The show maker widget", "It makes the best shows widgets")
nominee2.add_invention("The code maker widget", "It makes the best code widgets")
nominee3.add_invention("The deisgn maker widget", "It makes the best design widgets")

# add nominee to show
show.add_nominee(nominee1)
show.add_nominee(nominee2)
show.add_nominee(nominee3)

# create and add award to show
show.add_award(Award.new("Granted Patent of the Year", "This award was created to address the need to recognize the LOB that owns the
implementation and execution of the invention"))
show.add_award(Award.new("Invention of the Year", "In the opinion of the Patent Steering Committee, the invention best satisfies the
Core Criteria."))
show.add_award(Award.new("Visionary Award", "In the opinion of the Patent Steering Committee, the invention is anticipated to best
satisfy the Core Criteria in 3-5 years."))


show.start

show.conclude

