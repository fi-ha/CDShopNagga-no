class AddIndexItemGenresGenreId < ActiveRecord::Migration[5.2]
  def change
  	add_index :item_genres, :genre_id
  end
end
