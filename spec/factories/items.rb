FactoryBot.define do
  factory :item do
    association :user
    
    product_name {"test"}
    product_description {"test"}
    category_id {"2"}
    product_status_id {"2"}
    shipping_charge_id {"2"}
    prefecture_id {"2"}
    shipping_day_id {"2"}
    price { "5555555" }

    after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
