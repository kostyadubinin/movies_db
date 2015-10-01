class SyncMoviesJob < ActiveJob::Base
  LAST_PAGE = 50
  queue_as :default

  def perform
    (1..LAST_PAGE).each do |page|
      movies_attrs = TMDB::Movie.popular(page: page)

      movies_attrs.each do |movie_attrs|
        MovieImporter.import(movie_attrs)
      end
    end
  end
end
