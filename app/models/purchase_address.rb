class PurchaseAddress
  attr_accessor :token
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :purchase

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1 } 
    validates :municipality
    validates :address 
    validates :phone_number, numericality: {only_integer: true}, length: { maximum: 11 }
    validates :token
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, purchase_id: purchase.id)
  end
end


