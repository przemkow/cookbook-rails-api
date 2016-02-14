class AddFavouritesFollowersTable < ActiveRecord::Migration
  create_table :favourites_followers, id: false do |t|
    t.belongs_to :user, index: true
    t.belongs_to :recipe, index: true
  end
end
