require "redis"
require "../src/Movie"
require "../src/User"

ARGV.each do|a|
  redis = Redis.new

  case a
  when "1"
    user = User.new(
        password: "hola",
        name: "john",
        surname: "johnson",
        mail: "john@gmail.com"
    )

    redis.set("user:#{user.id}", user.to_json)
    puts redis.mget("user:#{user.id}")
  when "2"
    movie = Movie.new(
        name: "harry potter",
        director: "john",
        released_date: 20190813
    )

    redis.set("movie:#{movie.id}", movie.to_json)
    puts redis.mget("movie:#{movie.id}")
  end
end