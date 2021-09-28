class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  def index
    @films = Film.all
  end

  def show
    @cast = Cast.new
  end

  def new
    @film = Film.new
  end

  def create
    @film = Film.new(film_params)
    if @film.save
      redirect_to film_path(@film)
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @film.update(film_params)
      redirect_to film_path(@film)
    else
      render 'edit'
    end
  end

  def destroy
    if @film.destroy
      redirect_to films_url
    else
      redirect_to films_url
    end
  end

  private

  def film_params
    params.require(:film).permit(:title, :rating, :photo, :genre_id)
  end

  def set_film
    @film = Film.find(params[:id])
  end
end
