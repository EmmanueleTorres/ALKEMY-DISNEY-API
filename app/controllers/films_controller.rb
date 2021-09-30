class FilmsController < ApplicationController
  before_action :set_film, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name].present?
      @query = params[:name].capitalize
      @films = Film.where("title LIKE ?", "%" + @query + "%")
    elsif params[:genre_id].present?
      @query = params[:genre_id]
      @films = Film.includes(:genre).where('genres.id = ?', @query).references(:genres)
    elsif params[:order].present?
      @query = params[:order]
      if @query == "ASC"
        @films = Film.order(created_at: :asc)
      elsif @query == "DESC"
        @films = Film.order(created_at: :desc)
      else
        @films = Film.all
      end
    else
      @films = Film.all
    end
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
      render :new
    end
  end

  def edit
  end
  
  def update
    if @film.update(film_params)
      redirect_to film_path(@film)
    else
      render :edit
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
