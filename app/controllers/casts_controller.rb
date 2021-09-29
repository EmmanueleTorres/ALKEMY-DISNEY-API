class CastsController < ApplicationController
  def new
    if params[:film_id].present?
      @film = Film.find(params[:film_id])
      @cast = Cast.new
    else
      @character = Character.find(params[:character_id])
      @cast = Cast.new
    end
  end

  def create
    if params[:film_id].present?
      @film = Film.find(params[:film_id])
      @cast = Cast.new(cast_film_params)
      @cast.film = @film
      if @cast.save
        redirect_to film_path(@film)
      else
        render :new
      end
    else
      @character = Character.find(params[:character_id])
      @cast = Cast.new(cast_character_params)
      @cast.character = @character
      if @cast.save
        redirect_to character_path(@character)
      else
        render :new
      end
    end
  end

  def destroy
    @cast = Cast.find(params[:id])
    @cast.destroy
    redirect_to film_path(@cast.film)
  end
  
  private

  def cast_film_params
    params.require(:cast).permit(:comment, :character_id)
  end

  def cast_character_params
    params.require(:cast).permit(:comment, :film_id)
  end
end
