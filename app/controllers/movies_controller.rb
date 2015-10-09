class MoviesController < ApplicationController
  def index
    @movies = Movie.order(popularity: :desc).limit(24)
  end
end
