class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :trackable, :validatable

  validates :email, presence: true, uniqueness: true

  has_many :solutions
  has_many :challenges, :through => :solutions
  has_many :contests, :through => :solutions

end
