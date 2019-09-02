class Comment < JSONable

  @@autogeneration = 0

  def initialize(attrs)
    @id = @@autogeneration
    @user_id = attrs.fetch(:user_id).parameterize
    @movie_id = attrs.fetch(:movie_id).parameterize
    @text = attrs.fetch(:text).parameterize

    @@autogeneration = @@autogeneration + 1
  end
end
