class AddLatitudeAndLongitudeToShops < ActiveRecord::Migration[7.0]
  def change
    add_column :shops, :latitude, :decimal, precision: 17, scale: 14
    add_column :shops, :longitude, :decimal, precision: 17, scale: 14
  end
end
