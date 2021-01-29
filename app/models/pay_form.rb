class PayForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(
      item_id: item_id,
      user_id: user_id
    )
    address.create(
      order_id: order.id,
      postal_cord: postal_cord,
      prefecture_id: prefecture_id,
      city: city,
      address: address,
      building: building,
      phone_number: phone_number
    )
  end

end