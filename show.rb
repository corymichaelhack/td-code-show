
# show.rb
require 'date'
require './nominee'
require './invention'
require './award'

class ShowBuildFail < StandardError
end

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

  def list_nominees
    puts "Your nominees are:"
    @nominees.each do |nominee|
      puts "#{nominee.name},  #{nominee.title} for #{nominee.list_inventions}"
    end
  end

  def add_award_to_show(award)
    @awards << award
  end

  def build
    puts "Let's build the #{@date.strftime("%Y")} #{@name} show. #{@description}"
    if @nominees.empty?
      return false
    end
    true
  end

  def is_build_complete?
    self.build ? true : false  
  end

  def start
    if self.is_build_complete? 
      puts "Let's start the show!!"
      list_nominees
    else
      raise ShowBuildFail, "Show failed to build"
    end
  end
end

show = Show.new("TD Patent Awards", "The best patent awards show in the world!")

nominee1 = Nominee.new("Tom", "Enigneer")
# puts nominee1.to_s
# show.add_nominee(Nominee.new("Jerry", "Enigneer"))
# show.add_nominee(Nominee.new("Cindy", "Enigneer"))

nominee1.add_invention("The widget maker 1", "It makes the best widgets")
# show.add_invention_to_show(Invention.new("The widget maker 2", "It makes the best widgets"))
# show.add_invention_to_show(Invention.new("The widget maker 3", "It makes the best widgets"))

show.add_nominee(nominee1)

# show.add_award_to_show(Award.new("Granted Patent of the Year", "description here"))
# show.add_award_to_show(Award.new("Invention of the Year", "description here"))
# show.add_award_to_show(Award.new("Visionary Award", "description here"))

show.start

