class CreateCircusesFleas < ActiveRecord::Migration[5.0]
  def change
    create_table :circuses_fleas do |t|
      t.belongs_to :circus, foreign_key: true
      t.belongs_to :flea, foreign_key: true
    end
  end
end
