class AddUserToCircuses < ActiveRecord::Migration[5.0]
  def change
    add_reference :circuses, :user, foreign_key: true
  end
end
