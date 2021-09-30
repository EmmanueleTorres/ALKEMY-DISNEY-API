class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name].present?
      @query = params[:name].capitalize
      @characters = Character.where("name LIKE ?", "%" + @query + "%")
    elsif params[:age].present?
      @query = params[:age]
      @characters = Character.where("age = ?", @query)
    elsif params[:film_id].present?
      @query = params[:film_id]
      @characters = Character.includes(:films).where('films.id = ?', @query).references(:films)
    else
      @characters = Character.all
    end
  end

  def show
    @cast = Cast.new
  end

  def new
    @character = Character.new
  end
  
  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @character.update(character_params)
      redirect_to character_path(@character)
    else
      render :edit
    end
  end
  
  def destroy
    @character.destroy
    redirect_to characters_path
  end
  
  private

  def character_params
    params.require(:character).permit(:name, :age, :weight, :history, :photo)
  end

  def set_character
    @character = Character.find(params[:id])
  end
  
end
