class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end
  
  def create
    @character = Character.new(character_params)
    @character.save
    redirect_to character_path(@character)
  end

  def edit
    @character = Character.find(params[:id])
  end
  
  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    redirect_to character_path(@character)
  end
  
  def destroy
    @character = Character.find(params[:id])
    @character.destroy
    redirect_to characters_path
  end
  
  private

  def character_params
    params.require(:character).permit(:name, :age, :weight, :history)
  end

  def set_character
    @character = Character.find(params[:id])
  end
  
end
