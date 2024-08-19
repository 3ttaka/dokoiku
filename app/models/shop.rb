class Shop < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  def self.search(search)
    if search != ""
      Shop.where('shop_name LIKE(?)', "%#{search}%")
    else
      Shop.all
    end
  end

  def average_cleanliness
    reviews.average(:cleanliness).to_f
  end

  def average_lighting
    reviews.average(:lighting).to_f
  end

  def average_music
    reviews.average(:music).to_f
  end

  def average_space
    reviews.average(:space).to_f
  end

  def average_vibrancy
    reviews.average(:vibrancy).to_f
  end

  def average_order_speed
    reviews.average(:order_speed).to_f
  end

  def average_service_style
    reviews.average(:service_style).to_f
  end

  def average_conversation
    reviews.average(:conversation).to_f
  end
end

