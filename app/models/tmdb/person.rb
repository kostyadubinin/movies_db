module TMDB
  class Person < Base
    def self.popular
      get("/person/popular")
    end

    def self.find(id)
      get("/person/#{id}")
    end
  end
end
