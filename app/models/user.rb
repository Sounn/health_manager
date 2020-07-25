class User < ApplicationRecord
  #関連付け
  has_many :bodis, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  #バリデーション
  validates :name, presence: true, length: { in: 2..100 }
end
