class ApplicationController < ActionController::Base
  def index
    @genres = Genre.all
  end
end
