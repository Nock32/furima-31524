class UserOrder
  include ActiveModel::Model
  attr_accessor :zip_number,:dispatch_area_id , :city, :block_number , :building_name , :phone_number , :item_id , :user_id , :token , :price

  with_options presence: true do
    validates :zip_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :dispatch_area_id
    validates :city
    validates :block_number
    validates :phone_number , numericality: { only_integer: true, message: "is invalid. Input half-width characters." }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :phone_number, length: { maximum: 11, too_long: "を正しい電話番号を記入してください" }

  def save
    order = Order.create(user_id:user_id , item_id: item_id)
    Address.create(zip_number: zip_number, dispatch_area_id: dispatch_area_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number , order_id: order.id)

  end
end