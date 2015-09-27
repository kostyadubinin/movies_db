class SyncMovieJob < ActiveJob::Base
  queue_as :default

  def perform(tmdb_id:)
    attrs = TMDB::Movie.find(tmdb_id)
    movie = Movie.find_or_initialize_by(tmdb_id: tmdb_id)
    movie.update(attrs)
  end
end
