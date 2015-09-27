module TMDB
  class Movie < Base
    DEFAULTS = "credits,videos,similar".freeze

    pattr_initialize :id

    def self.find(id)
      new(id).find
    end

    def self.top_rated
      movies_attrs = get("/movie/top_rated")["results"]
      movies_attrs.map { |movie_attrs| new(movie_attrs["id"]).find }
    end

    def find
      path = "/movie/#{id}"
      response = self.class.get(path, query: { append_to_response: DEFAULTS })
      Formatters::Movie.prepare(response)
    end
  end
end
