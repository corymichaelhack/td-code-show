# nominee.rb

class Nominee
  attr_accessor :name, :title, :status, :inventions

  def initialize(name, title, status = nil)
    @name = name
    @title = title
    @inventions = []
    @status = status
  end

  def add_invention(invention_title, invention_description)
    @inventions << Invention.new(invention_title, invention_description)
  end

  def list_inventions
    string = ''
    @inventions.each do |invention|
      string << "#{invention.title}: #{invention.description}"
    end
    string
  end

  # def is_winner?
  #   @status == true
  # end
end