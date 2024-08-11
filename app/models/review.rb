class Review < ApplicationRecord
  belongs_to :shop
  belongs_to :user

  validates :cleanliness, :space, :lighting, :music, :vibrancy,
            :order_speed, :service_style, :conversation,
            presence: true,
            numericality: { only_integer: true, greater_than_or_equal_to: -3, less_than_or_equal_to: 3 }

  validates :description, length: { maximum: 1000 }

  # 条件付きバリデーション: レビューが直接投稿される場合のみ`shop_id`の存在をチェックする
  validates :shop_id, presence: true, if: :direct_review_creation?

  private

  # レビューが直接投稿される場合にtrueを返すメソッド
  def direct_review_creation?
    shop_id.present?
  end
end
