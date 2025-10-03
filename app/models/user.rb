class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :body, length: { maximum: 200 }, presence: true

  has_many :groups, dependent: :destroy
  has_many :posts, dependent: :destroy
end
