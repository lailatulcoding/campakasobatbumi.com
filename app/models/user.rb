class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_paper_trail
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  mount_uploader :avatar, ImageUploader
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  
end
