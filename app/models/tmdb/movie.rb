module TMDB
  class Movie < Base
    DEFAULTS = "credits,videos,similar".freeze

    pattr_initialize :id

    def self.find(id)
      new(id).find
    end

    def find
      path = "/movie/#{id}"
      response = self.class.get(path, query: { append_to_response: DEFAULTS })
      Formatters::Movie.prepare(response)
    end
  end
end
