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
    Movie.generate_movies(redis)

    list = redis.zrange("movies", 0, 9)
    list_keys = list.map { |id| "movie:#{id}" }

    for i in 0..list_keys.size
      puts redis.hget(list_keys[i], "title")
    end
  when "5"
    Comment.generate_comments(redis)

    puts redis.lrange("comments_by_movies:2", 0, 2)
  when "6"
    list_of_keys = redis.keys("comments_by_movies*")
    list_of_keys = list_of_keys.map {|string| string.partition(":").last }

    puts list_of_keys.length
  when "7"
    puts redis.hget("movie:2", "comments_quantity")
  when "8"
    puts redis.smembers("emails")
  end
end