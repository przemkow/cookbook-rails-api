class Recipe < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :followers, class_name: 'User', join_table: 'favourites_followers', foreign_key: 'recipe_id' ,association_foreign_key: 'user_id'

  validates :name, presence: true
  validates :description, presence: true
  validates :preparation_time_in_min, presence: true
end
