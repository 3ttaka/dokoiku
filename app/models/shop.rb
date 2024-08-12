class Shop < ApplicationRecord
  belongs_to :user
  def self.search(search)
    if search != ""
      Shop.where('shop_name LIKE(?)', "%#{search}%")
    else
      Shop.all
    end
  end
end

