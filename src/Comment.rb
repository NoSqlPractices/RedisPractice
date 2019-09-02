require "../src/JSONable"

class Comment < JSONable

  @@autogeneration = 0

  attr_accessor :id

  def initialize(attrs)
    @id = @@autogeneration
    @user_id = attrs.fetch(:user_id)
    @movie_id = attrs.fetch(:movie_id)
    @text = attrs.fetch(:text)

    @@autogeneration = @@autogeneration + 1
  end
end
