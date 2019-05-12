class GenresController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private
  # httpリクエストのPOSTの時に内部に流れてきたgenreキーを持つパラメータをコントローラ内部に受け取ることを許可する
    def genre_params
      params.require(:genre).permit(:genre_name)
    end
end
