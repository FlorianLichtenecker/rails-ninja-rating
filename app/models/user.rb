class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reports
  has_many :user_review_platforms
  has_many :reviews, through: :user_review_platforms
  has_many :review_platforms, through: :user_review_platforms
end
