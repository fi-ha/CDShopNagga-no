class AddIndexReviewsReviewId < ActiveRecord::Migration[5.2]
  def change
  	add_index :reviews, :review_id
  end
end
