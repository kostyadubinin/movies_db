class MovieCreator < BaseCreator
  private

  def scope
    Movie
  end

  def permitted_attributes
    [:budget, :tmdb_id, :imdb_id, :overview, :popularity, :poster_path,
     :release_date, :revenue, :runtime, :tagline, :title, :vote_average,
     :vote_count]
  end
end
