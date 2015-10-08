class SyncMoviesJob < ActiveJob::Base
  queue_as :default

  def perform(amount: 1000)
    TMDB::Movie.find_each(:popular, amount: amount) do |movie_attrs|
      MovieImporter.import(movie_attrs)
    end
  end
end
