module TMDB
  class Movie < Base
    APPEND_TO_RESPONSE = "credits,videos,similar".freeze

    def self.find(id)
      get("/movie/#{id}", query: { append_to_response: APPEND_TO_RESPONSE })
    end
  end
end
