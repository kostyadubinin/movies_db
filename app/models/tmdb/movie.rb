module TMDB
  class Movie < Base
    DEFAULTS = "credits,videos,similar".freeze

    static_facade :find, :id

    def self.popular(page: 1)
      response = get("/movie/popular", query: { page: page })

      response["results"].map do |basic_movie_attrs|
        full_movie_attrs = find(basic_movie_attrs["id"])
        yield(full_movie_attrs) if block_given?
        full_movie_attrs
      end
    end

    def find
      path = "/movie/#{id}"
      response = self.class.get(path, query: { append_to_response: DEFAULTS })
      Formatters::Movie.prepare(response)
    end
  end
end
