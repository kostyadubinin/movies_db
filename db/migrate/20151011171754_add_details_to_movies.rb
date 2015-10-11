class AddDetailsToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :adult, :boolean, null: false, default: false
    add_column :movies, :backdrop_path, :string
    add_column :movies, :homepage, :string
    add_column :movies, :original_language, :string
    add_column :movies, :original_title, :string
    add_column :movies, :status, :string
  end
end
