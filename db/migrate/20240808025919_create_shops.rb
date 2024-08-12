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
      t.string :wifi
      t.string :smoking
      t.string :payment_methods, default: "", null: false
      t.string :price_range, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

