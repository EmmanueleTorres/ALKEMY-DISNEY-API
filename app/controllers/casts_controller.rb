class CastsController < ApplicationController
  def new
    @film = Film.find(params[:film_id])
    @cast = Cast.new
  end

  def create
    @film = Film.find(params[:film_id])
    @cast = Cast.new(cast_params)
    @cast.film = @film
    if @cast.save
      redirect_to film_path(@film)
    else
      render :new
    end
  end

  def destroy
    @cast = Cast.find(params[:id])
    @cast.destroy
    redirect_to film_path(@cast.film)
  end
  
  private

  def cast_params
    params.require(:cast).permit(:comment, :character_id)
  end
end
