class MoviePresenter < BasePresenter
  BASE_URL = "http://image.tmdb.org/t/p/"
  POSTER_SIZE = 342

  def poster_url
    "#{BASE_URL}w#{POSTER_SIZE}#{object.poster_path}"
  end
end
