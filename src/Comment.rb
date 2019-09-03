require "../src/JSONable"

class Comment < JSONable

  @@autogeneration = 0

  attr_reader :id

  def initialize(attrs)
    @id = @@autogeneration
    @user_id = attrs.fetch(:user_id)
    @movie_id = attrs.fetch(:movie_id)
    @text = attrs.fetch(:text)

    redis = attrs.fetch(:redis)

    redis.hmset("comment:#{@id}", "movie_id", @movie_id, "user_id", @user_id, "text", @text)
    redis.lpush("comments_by_movies:#{@movie_id}", @user_id)
    redis.hincrby("movie:#{@movie_id}", "comments_quantity", 1)

    @@autogeneration = @@autogeneration + 1
  end

  def self.generate_comments(redis)
    Comment.new(
        user_id: 0,
        movie_id: 2,
        text: "awesome",
        redis: redis
    )

    Comment.new(
        user_id: 1,
        movie_id: 2,
        text: "more awesome",
        redis: redis
    )

    Comment.new(
        user_id: 0,
        movie_id: 4,
        text: "bad",
        redis: redis
    )

    Comment.new(
        user_id: 5,
        movie_id: 2,
        text: "kind of",
        redis: redis
    )

    Comment.new(
        user_id: 0,
        movie_id: 2,
        text: "again awesome",
        redis: redis
    )

    Comment.new(
        user_id: 0,
        movie_id: 2,
        text: "super again awesome",
        redis: redis
    )
  end
end
