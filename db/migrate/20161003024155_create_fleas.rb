class CreateFleas < ActiveRecord::Migration[5.0]
  def change
    create_table :fleas do |t|
      t.string :skill
      t.belongs_to :dog, foreign_key: true

      t.timestamps
    end
  end
end
