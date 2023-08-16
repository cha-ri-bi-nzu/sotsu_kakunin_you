class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :groupings, dependent: :destroy
  has_many :groups, through: :groupings, source: :group
  has_many :groups, foreign_key: :owner_id
end
