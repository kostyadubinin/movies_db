class Movie < ActiveRecord::Base
  validates :budget, :revenue, :runtime, allow_nil: true,
            numericality: { only_integer: true, greater_than: 0 }

  validates :tmdb_id, presence: true, uniqueness: true
  validates :imdb_id, uniqueness: true, allow_nil: true
  validates :popularity, :vote_average, numericality: true
  validates :vote_count, numericality: { only_integer: true }
end
