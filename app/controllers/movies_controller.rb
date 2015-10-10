class MoviesController < ApplicationController
  def index
    @movies = Movie.order(popularity: :desc).page(params[:page])
  end
end
