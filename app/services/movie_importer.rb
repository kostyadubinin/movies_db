class MovieImporter
  static_facade :import, :attributes

  def import
    movie = Movie.find_or_initialize_by(tmdb_id: attributes[:tmdb_id])
    movie.assign_attributes(attributes)

    log_errors(movie) unless movie.save
    movie
  end

  private

  def log_errors(movie)
    return if movie.valid?

    errors = movie.errors.full_messages.to_sentence
    Rails.logger.tagged("Movie Importing Error") do
      Rails.logger.info("TMDB Movie #{movie.tmdb_id}:\ #{errors}")
    end
  end
end
