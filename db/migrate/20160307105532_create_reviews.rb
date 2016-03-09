class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :expert_name
      t.text :review
      t.integer :rating
      t.references :wine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
