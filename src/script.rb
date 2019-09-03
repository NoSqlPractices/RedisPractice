require "redis"
require "../src/Movie"
require "../src/User"
require "../src/Comment"

ARGV.each do |a|
  redis = Redis.new
  case a
  when "1"
    user = User.new(
        password: "hola",
        name: "john",
        surname: "johnson",
        mail: "john@gmail.com",
        redis: redis
    )

    puts redis.hgetall("user:#{user.id}")
  when "2"
    movie = Movie.new(
        name: "harry potter",
        director: "john",
        released_date: 20190813,
        redis: redis
    )

    puts redis.hgetall("movie:#{movie.id}")
  when "3"
    comment = Comment.new(
        user_id: 0,
        movie_id: 0,
        text: "Best movie ever",
        redis: redis
    )

    puts redis.hgetall("comment:#{comment.id}")
  when "4"
    puts redis.zrange("movies:titleByReleasedDate", 0, 9)
  when "5"
    puts redis.lrange("comments:movie:2:users", 0, 2)
  when "6"
    puts redis.scard("comments:movies")
  when "7"
    puts redis.hget("movie:2", "comments_quantity")
  when "8"
    puts redis.smembers("users:emails")
  end
end