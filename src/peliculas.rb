require "redis"
require "json"

class JSONable
  def to_json
    hash = {}
    self.instance_variables.each do |var|
      hash[var] = self.instance_variable_get var
    end
    hash.to_json
  end
  def from_json! string
    JSON.load(string).each do |var, val|
      self.instance_variable_set var, val
    end
  end
end

class Movie < JSONable

  @@autogeneration = 0

  def initialize(attrs)
    @id = @@autogeneration
    @name = attrs.fetch(:name).parameterize
    @director = attrs.fetch(:director).parameterize
    @released_date = attrs.fetch(:released_date).parameterize

    @@autogeneration = @@autogeneration + 1
  end
end

class User < JSONable

  @@autogeneration = 0

  def initialize(attrs)
    @id = @@autogeneration
    @password = attrs.fetch(:password)
    @name = attrs.fetch(:name)
    @surname = attrs.fetch(:surname)
    @mail = attrs.fetch(:mail)

    @@autogeneration = @@autogeneration + 1
  end

end

class Comment < JSONable

  @@autogeneration = 0

  def initialize(attrs)
    @id = @@autogeneration
    @user_id = attrs.fetch(:user_id).parameterize
    @movie_id = attrs.fetch(:movie_id).parameterize
    @text = attrs.fetch(:text).parameterize

    @@autogeneration = @@autogeneration + 1
  end
end

redis = Redis.new
user = User.new(
               password: "hola",
               name: "john",
               surname: "johnson",
               mail: "john@gmail.com"
           )

redis.set("user:1", user.to_json)
puts redis.mget('user:1')