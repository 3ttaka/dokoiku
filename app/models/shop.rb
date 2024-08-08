class Shop < ApplicationRecord
  with_options presence: true do
    validates :shop_name
    validates :closed_days
    validates :opening_hours
    validates :address
    validates :cleanliness_average
    validates :space_average
    validates :lighting_average
    validates :music_average
    validates :vibrancy_average
    validates :order_speed_average
    validates :service_style_average
    validates :conversation_average
    validates :space_average
    validates :space_average
  end

  belongs_to user
end

