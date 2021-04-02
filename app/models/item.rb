class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :product_status
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :shipping_charge
  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end

  validates :category_id, :product_status_id, :prefecture_id, :shipping_day_id, :shipping_charge_id, numericality: { other_than: 1 } 
end
