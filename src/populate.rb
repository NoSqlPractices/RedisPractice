require "redis"

ARGV.each do
    redis = Redis.new

    # Feed db with users
    User.new(
        name: "pablo",
        surname: "fernandez",
        password: 'password',
        mail: 'pablo@gmail.com',
        redis: redis
    )
    User.new(
        name: "pepe",
        surname: "grillo",
        password: 'password',
        mail: 'ppgrillo@gmail.com',
        redis: redis
    )

    # Feed db with movies
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
    # Feed db with comments
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
        user_id: 1,
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
        user_id: 1,
        movie_id: 2,
        text: "super again awesome",
        redis: redis
    )
end