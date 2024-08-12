class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    review = Review.create(review_params)
    redirect_to "/shops/#{review.shop.id}"
  end

  private
  def review_params
    params.require(:review).permit(:cleanliness, :space, :lighting, :music, :vibrancy, :order_speed, :service_style, :conversation, :description).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
