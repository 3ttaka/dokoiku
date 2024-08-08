class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :shop_name, null: false
      t.string :cuisine_type
      t.string :closed_days, null: false
      t.string :opening_hours, null: false
      t.string :address, null: false
      t.string :phone_number
      t.text :additional_info
      t.integer :wifi
      t.integer :smoking
      t.string :payment_methods, default: "", null: false
      t.float :cleanliness_average, null: false, default: 0.0
      t.float :space_average, null: false, default: 0.0
      t.float :lighting_average, null: false, default: 0.0
      t.float :music_average, null: false, default: 0.0
      t.float :vibrancy_average, null: false, default: 0.0
      t.float :order_speed_average, null: false, default: 0.0
      t.float :service_style_average, null: false, default: 0.0
      t.float :conversation_average, null: false, default: 0.0
      t.float :modal_price_range
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
