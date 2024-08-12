class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :cleanliness, null: false, default: 0
      t.integer :space, null: false, default: 0
      t.integer :lighting, null: false, default: 0
      t.integer :music, null: false, default: 0
      t.integer :vibrancy, null: false, default: 0
      t.integer :order_speed, null: false, default: 0
      t.integer :service_style, null: false, default: 0
      t.integer :conversation, null: false, default: 0
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.references :shop, null: false, foreign_key: true
      t.timestamps
    end
  end
end
