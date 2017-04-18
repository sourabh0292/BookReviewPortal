class AddUserIdToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :u_ser_id, :integer
  end
end
