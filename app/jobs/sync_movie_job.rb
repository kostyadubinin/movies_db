class SyncMovieJob < ActiveJob::Base
  queue_as :default

  def perform(tmdb_id:)
    @tmdb_id = tmdb_id
    Movie.create_with(movie_attrs).find_or_create_by(tmdb_id: tmdb_id)
  end

  private

  attr_reader :tmdb_id

  def movie_attrs
    @movie_attrs ||= MovieAttributesPreparer.prepare(
      TMDB::Movie.find(tmdb_id)
    )
  end
end
