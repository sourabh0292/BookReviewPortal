class AddUSerIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :u_ser_id, :integer
  end
end
