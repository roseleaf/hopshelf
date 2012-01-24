class RenameGenreToGenres < ActiveRecord::Migration
    def change
        rename_table :genre, :genres
    end 
 end
