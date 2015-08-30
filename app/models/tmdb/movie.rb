module TMDB
  class Movie < Base
    APPEND_TO_RESPONSE = "credits,videos,similar".freeze

    def self.now_playing
      get("/movie/now_playing")
    end

    def self.popular
      get("/movie/popular")
    end

    def self.top_rated
      get("/movie/top_rated")
    end

    def self.upcoming
      get("/movie/upcoming")
    end

    def self.find(id)
      get("/movie/#{id}", query: { append_to_response: APPEND_TO_RESPONSE })
    end
  end
end
