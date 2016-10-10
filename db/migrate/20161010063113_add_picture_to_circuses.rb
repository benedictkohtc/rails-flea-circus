class AddPictureToCircuses < ActiveRecord::Migration[5.0]
  def change
    add_column :circuses, :picture, :string
  end
end
