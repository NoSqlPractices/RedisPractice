require "redis"

class MoviesServer

  @@autogenration = 0

  def initialize(attrs)
    @id = autogeneration + 1
    @name = attrs.fetch(:name).parameterize
    @name = attrs.fetch(:name).parameterize
    @name = attrs.fetch(:name).parameterize
    @name = attrs.fetch(:name).parameterize

    @@autogeneration = @@autogeneration + 1
  end
end

redis = Redis.new
redis.set("user:1", "hello world")
puts redis.mget('user:1')