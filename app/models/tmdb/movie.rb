module TMDB
  class Movie < Base
    DEFAULTS = "credits,videos,similar".freeze

    def self.find(id)
      new(id).find
    end

    def initialize(id)
      @id = id
    end

    def find
      path = "/movie/#{id}"
      response = self.class.get(path, query: { append_to_response: DEFAULTS })
      Formatters::Movie.prepare(response)
    end

    private

    attr_reader :id
  end
end
