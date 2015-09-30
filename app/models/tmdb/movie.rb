module TMDB
  class Movie < Base
    DEFAULTS = "credits,videos,similar".freeze

    static_facade :find, :id

    def self.popular(page: 1)
      results = get("/movie/popular", query: { page: page })["results"]
      results.map { |result| result.deep_symbolize_keys }
    end

    def find
      path = "/movie/#{id}"
      response = self.class.get(path, query: { append_to_response: DEFAULTS })
      Formatters::Movie.prepare(response)
    end
  end
end
