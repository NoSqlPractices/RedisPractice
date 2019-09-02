require "../src/JSONable"

class Movie < JSONable

  @@autogeneration = 0

  attr_reader :id, :released_date

  def initialize(attrs)
    @id = @@autogeneration
    @title = attrs.fetch(:name)
    @director = attrs.fetch(:director)
    @released_date = attrs.fetch(:released_date)
    @comments_quantity = 0

    redis = attrs.fetch(:redis)

    redis.hmset("movie:#{@id}", "title", @title, "director", @director,
                "released_date", @released_date, "comments_quantity", @comments_quantity)
    redis.zadd("movies", @released_date, @id)

    @@autogeneration = @@autogeneration + 1
  end

  def self.generate_movies(redis)
    Movie.new(
        name: "harry potter",
        director: "john",
        released_date: 20190813,
        redis: redis
    )

    Movie.new(
        name: "el señor de los anillos",
        director: "wick",
        released_date: 20190816,
        redis: redis
    )

    Movie.new(
        name: "la bella durmiente",
        director: "disney",
        released_date: 20190819,
        redis: redis
    )

    Movie.new(
        name: "la bella y la bestia",
        director: "disney",
        released_date: 20190916,
        redis: redis
    )

    Movie.new(
        name: "La sirenita",
        director: "disney",
        released_date: 20161016,
        redis: redis
    )

    Movie.new(
        name: "la cenicienta",
        director: "disney",
        released_date: 20150314,
        redis: redis
    )

    Movie.new(
        name: "crepusculo",
        director: "someone",
        released_date: 20080416,
        redis: redis
    )

    Movie.new(
        name: "pulp fiction",
        director: "anotherone",
        released_date: 20140416,
        redis: redis
    )

    Movie.new(
        name: "volver al futuro",
        director: "martymcfly",
        released_date: 19890816,
        redis: redis
    )

    Movie.new(
        name: "terminator",
        director: "rambo",
        released_date: 20180413,
        redis: redis
    )

    Movie.new(
        name: "rapido y furioso",
        director: "dominic",
        released_date: 20140128,
        redis: redis
    )

  end

end