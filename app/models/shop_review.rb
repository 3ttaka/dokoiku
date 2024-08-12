class ShopReview
  include ActiveModel::Model

  attr_accessor :shop_name, :cuisine_type, :closed_days, :opening_hours, :address, :phone_number, :additional_info, :wifi, :smoking, :payment_methods, :price_range
  attr_accessor :cleanliness, :space, :lighting, :music, :vibrancy, :order_speed, :service_style, :conversation, :price_range, :description
  attr_accessor :user_id

  validates :shop_name, :closed_days, :opening_hours, :address,:payment_methods, :price_range, presence: true
  validates :cleanliness, :space, :lighting, :music, :vibrancy,
            :order_speed, :service_style, :conversation,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: -3, less_than_or_equal_to: 3 }
  validates :description, length: { maximum: 1000 }
  

  def save

    shop = Shop.create(
      shop_name: shop_name,
      cuisine_type: cuisine_type,
      closed_days: closed_days,
      opening_hours: opening_hours,
      address: address,
      phone_number: phone_number,
      additional_info: additional_info,
      wifi: wifi,
      smoking: smoking,
      payment_methods: payment_methods,
      price_range: price_range,
      user_id: user_id
    )

    Review.create(
      cleanliness: cleanliness,
      space: space,
      lighting: lighting,
      music: music,
      vibrancy: vibrancy,
      order_speed: order_speed,
      service_style: service_style,
      conversation: conversation,
      description: description,
      user_id: user_id,
      shop_id: shop.id
    )
  end
end