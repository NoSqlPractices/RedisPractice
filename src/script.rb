require "redis"
require "../src/Movie"
require "../src/User"
require "../src/Comment"

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
  when "3"
    comment = Comment.new(
        user_id: 0,
        movie_id: 0,
        text: "Best movie ever"
    )

    redis.set("comment:#{comment.id}", comment.to_json)
    puts redis.mget("comment:#{comment.id}")
  end
end