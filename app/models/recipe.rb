class Recipe < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :followers, class_name: 'User', join_table: 'favourites_followers', association_foreign_key: 'user_id'
end
