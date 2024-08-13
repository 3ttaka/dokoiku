class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @shop = Shop.find(params[:shop_id])
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to shop_path(@review.shop), notice: 'レビューが投稿されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private
  def review_params
    params.require(:review).permit(:cleanliness, :space, :lighting, :music, :vibrancy, :order_speed, :service_style, :conversation, :description, images: []).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
