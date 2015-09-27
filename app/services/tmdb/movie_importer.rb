module TMDB
  class MovieImporter
    pattr_initialize :tmdb_id

    def self.import(tmdb_id)
      new(tmdb_id).import
    end

    def import
      attrs = TMDB::Movie.find(tmdb_id)
      movie = ::Movie.find_or_initialize_by(tmdb_id: attrs[:tmdb_id])
      movie.assign_attributes(attrs)

      log_errors(movie) unless movie.save
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
end
