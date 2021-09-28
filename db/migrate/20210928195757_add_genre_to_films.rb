class AddGenreToFilms < ActiveRecord::Migration[6.0]
  def change
    add_reference :films, :genre, null: false, foreign_key: true
  end
end
