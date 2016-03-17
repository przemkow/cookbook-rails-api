class User < ActiveRecord::Base

  before_create :generate_authentication_token!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :auth_token, uniqueness: true

  has_many :recipes
  has_and_belongs_to_many :favourites, class_name: 'Recipe', join_table: 'favourites_followers', foreign_key: 'user_id', association_foreign_key: 'recipe_id'

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
