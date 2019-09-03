class Movie

  @@autogeneration = 0

  attr_reader :id, :released_date

  def initialize(attrs)
    @id = @@autogeneration
    @title = attrs.fetch(:name)
    @director = attrs.fetch(:director)
    @released_date = attrs.fetch(:released_date)
    @comments_quantity = 0

    redis = attrs.fetch(:redis)

    redis.multi do
      redis.hmset("movie:#{@id}", "title", @title, "director", @director,
                  "released_date", @released_date, "comments_quantity", @comments_quantity)
      redis.zadd("movie:titleByReleasedDate", @released_date, @title)
    end

    @@autogeneration = @@autogeneration + 1
  end
end