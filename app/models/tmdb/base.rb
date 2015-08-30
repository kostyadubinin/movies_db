module TMDB
  class Base
    include HTTParty

    base_uri "api.themoviedb.org/3/"
    default_params api_key: ENV["TMDB_API_KEY"]
  end
end
