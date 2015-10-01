module TMDB
  class Movie < Base
    DEFAULTS = "credits,videos,similar".freeze

    static_facade :find, :id

    def self.popular(page: 1)
      movies_attrs = get("/movie/popular", query: { page: page })["results"]
      movies_attrs.map { |movie_attrs| find(movie_attrs["id"]) }
    end

    def find
      path = "/movie/#{id}"
      response = self.class.get(path, query: { append_to_response: DEFAULTS })
      Formatters::Movie.prepare(response)
    end
  end
end
