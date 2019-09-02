require "../src/JSONable"

class User < JSONable

  @@autogeneration = 0

  attr_accessor :id

  def initialize(attrs)
    @id = @@autogeneration
    @password = attrs.fetch(:password)
    @name = attrs.fetch(:name)
    @surname = attrs.fetch(:surname)
    @mail = attrs.fetch(:mail)

    @@autogeneration = @@autogeneration + 1
  end

end