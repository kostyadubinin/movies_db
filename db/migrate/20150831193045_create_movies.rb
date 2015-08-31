class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :budget
      t.string :tmdb_id
      t.string :imdb_id
      t.text :overview
      t.float :popularity
      t.string :poster_path
      t.datetime :release_date
      t.integer :revenue
      t.integer :runtime
      t.string :tagline
      t.string :title
      t.float :vote_average
      t.integer :vote_count

      t.timestamps null: false
    end
  end
end
