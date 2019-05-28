class Administrator::GenresController < ApplicationController
    before_action :authenticate_user!
    before_action :admin_user

   def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to administrator_genres_path
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to administrator_genres_path
  end

  def destroy
    genre = Genre.find(params[:id])
    genre.destroy
    redirect_to administrator_genres_path
  end

  private
  # httpリクエストのPOSTの時に内部に流れてきたgenreキーを持つパラメータをコントローラ内部に受け取ることを許可する
    def genre_params
      params.require(:genre).permit(:genre_name)
    end
    def admin_user
        redirect_to(items_path) unless current_user.admin?
    end
end
