# invention.rb

class Invention
  attr_accessor :title, :description

  def initialize(title, description)
    @title = title
    @description = description
  end
end