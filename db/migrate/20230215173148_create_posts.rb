class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :country
      t.string :state
      t.string :city
      t.references :category, null: false, foreign_key: true
      t.text :text
      t.string :restaurant_tip
      t.string :tour_tip

      t.timestamps
    end
  end
end
