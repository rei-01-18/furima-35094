FactoryBot.define do
  factory :user do
    nickname {"test太郎"}
    email {"aaa@aa"}
    password {"111aaa"}
    password_confirmation {"111aaa"}
    last_name {"テスト"}
    first_name {"太郎"}
    last_name_furigana {"テスト"}
    first_name_furigana {"タロウ"}
    birth_day {"1888-02-02"}
  end
end
