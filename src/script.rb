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
        text: "Best movie ever"
    )

    redis.set("comment:#{comment.id}", comment.to_json)
    puts redis.mget("comment:#{comment.id}")
  when "4"
    Movie.generate_movies(redis)

    list = redis.zrange("movies", 0, 9)
    list_keys = list.map { |id| "movie:#{id}" }

    for i in 0..list_keys.size
      puts redis.hget(list_keys[i], "title")
    end
  when "5"
    Comment.generate_comments(redis)

    puts redis.lrange("user_comments_by_movies:2", 0, 2)
  when "7"
    puts redis.hget("movie:2", "comments_quantity")
  end
end