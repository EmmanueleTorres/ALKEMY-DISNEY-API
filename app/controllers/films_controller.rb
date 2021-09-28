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
      flash[:success] = "Object successfully created"
      redirect_to film_path(@film)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @film.update(film_params)
      flash[:success] = "Object was successfully updated"
      redirect_to film_path(@film)
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    if @film.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to films_url
    else
      flash[:error] = 'Something went wrong'
      redirect_to films_url
    end
  end

  private

  def film_params
    params.require(:film).permit(:title, :rating, :photo)
  end

  def set_film
    @film = Film.find(params[:id])
  end
end
