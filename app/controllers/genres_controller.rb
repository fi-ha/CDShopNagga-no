class GenresController < ApplicationController
    before_action :authenticate_user!
  
   def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to genres_path
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to genres_path
  end

  private
  # httpリクエストのPOSTの時に内部に流れてきたgenreキーを持つパラメータをコントローラ内部に受け取ることを許可する
    def genre_params
      params.require(:genre).permit(:genre_name)
    end
end
