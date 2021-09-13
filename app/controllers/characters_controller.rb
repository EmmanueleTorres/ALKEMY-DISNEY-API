class CharactersController < ApplicationController
  before_action :set_character, only: [:show, :edit, :update, :destroy]

  def index
    if params[:name].present?
      @query = params[:name]
      @characters = Character.where("name LIKE ?", "%" + @query + "%")
    elsif params[:age].present?
      @query = params[:age]
      @characters = Character.where(age: @query)
    elsif params[:weight].present?
      @query = params[:weight]
      @characters = Character.where(weight: @query)
    else
      @characters = Character.all
    end
  end

  def show
  end

  def new
    @character = Character.new
  end
  
  def create
    @character = Character.new(character_params)
    if @character.save
      flash[:success] = "Object successfully created"
      redirect_to character_path(@character)
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def edit
  end
  
  def update
    @character.update(character_params)
    redirect_to character_path(@character)
  end
  
  def destroy
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
