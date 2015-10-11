class MovieImporter
  static_facade :import, :attributes

  def import
    movie = Movie.find_or_initialize_by(tmdb_id: attributes[:tmdb_id])
    movie.assign_attributes(attributes.slice(*permitted_movie_attributes))

    log_errors(movie) unless movie.save
    movie
  end

  private

  def permitted_movie_attributes
    [:budget, :tmdb_id, :imdb_id, :overview, :popularity, :poster_path,
     :release_date, :revenue, :runtime, :tagline, :title, :vote_average,
     :vote_count]
  end

  def log_errors(movie)
    return if movie.valid?

    errors = movie.errors.full_messages.to_sentence
    Rails.logger.tagged("Movie Importing Error") do
      Rails.logger.info("TMDB Movie #{movie.tmdb_id}:\ #{errors}")
    end
  end
end
