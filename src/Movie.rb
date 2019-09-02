require "../src/JSONable"

class Movie < JSONable

  @@autogeneration = 0

  attr_accessor :id

  def initialize(attrs)
    @id = @@autogeneration
    @name = attrs.fetch(:name)
    @director = attrs.fetch(:director)
    @released_date = attrs.fetch(:released_date)
    @comments_quantity = 0

    @@autogeneration = @@autogeneration + 1
  end

end