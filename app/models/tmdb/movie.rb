module TMDB
  class Movie < Base
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
      response = self.class.get("/movie/#{id}")
      Normalizer.(response, zero_to_nil: [:budget, :revenue, :timeline])
    end
  end
end
