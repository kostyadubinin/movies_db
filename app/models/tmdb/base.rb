module TMDB
  class Base
    PAGE_SIZE = 20
    MAX_PAGE = 1000

    include HTTParty

    base_uri "api.themoviedb.org/3/"
    default_params api_key: ENV["TMDB_API_KEY"]

    def self.find_each(fetcher, amount:)
      1.upto(max_page(amount)) do |page|
        entities = method(fetcher).(page: page) do |entity|
          yield(entity)
        end

        return unless entities
      end
    end

    # TODO: Should it be public?
    def self.max_page(amount)
      unless (amount % PAGE_SIZE).zero?
        fail "`amount` must be dividable by #{PAGE_SIZE}"
      end

      [(amount / PAGE_SIZE), MAX_PAGE].min
    end
  end
end
