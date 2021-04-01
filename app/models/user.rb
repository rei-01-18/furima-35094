class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        with_options presence: true do
          validates :nickname
          with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
            validates :last_name
            validates :first_name
          end
          with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
            validates :last_name_furigana
            validates :first_name_furigana
          end
          validates :birth_day
          validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
        end
end