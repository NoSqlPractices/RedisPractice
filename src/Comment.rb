class Comment

  @@autogeneration = 0

  attr_reader :id

  def initialize(attrs)
    @id = @@autogeneration
    @user_id = attrs.fetch(:user_id)
    @movie_id = attrs.fetch(:movie_id)
    @text = attrs.fetch(:text)

    redis = attrs.fetch(:redis)

    redis.multi do
      redis.hmset("comment:#{@id}", "movie_id", @movie_id, "user_id", @user_id, "text", @text)
      redis.lpush("movie:#{@movie_id}:users", @user_id)
      redis.sadd("movies_with_comments", @movie_id)
      redis.hincrby("movie:#{@movie_id}", "comments_quantity", 1)
    end

    @@autogeneration = @@autogeneration + 1
  end
end
