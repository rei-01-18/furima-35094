FactoryBot.define do
  factory :purchase_address do

    postal_code { "000-0000" }
    prefecture_id { 2 }
    municipality { "横浜市緑区" }
    address { "青山1-1-1" }
    building_name { "test" }
    phone_number { 00000000000 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
