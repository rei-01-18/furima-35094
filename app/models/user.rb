class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_many :items
        has_many :purchases

        validates :nickname, presence: true
        validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
        validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
        validates :last_name_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
        validates :first_name_furigana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
        validates :birth_day, presence: true
        validates :password, format: { with: /\A[a-z0-9]+\z/i }
end
