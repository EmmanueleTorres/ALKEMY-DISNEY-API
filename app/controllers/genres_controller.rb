class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @film = Film.new
  end
end
