class CreateCircuses < ActiveRecord::Migration[5.0]
  def change
    create_table :circuses do |t|
      t.string :name
      
      t.timestamps
    end
  end
end
