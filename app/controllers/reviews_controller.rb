class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

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

  def edit
    @review = Review.find(params[:id])
    if current_user.id != @review.user_id
      redirect_to shop_review_path(@review)
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to shop_review_path(@review)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if current_user.id == @review.user_id
      @review.destroy
      redirect_to root_path
    else
      redirect_to shop_review_path(@review)
    end
  end

  private
  def review_params
    params.require(:review).permit(:cleanliness, :space, :lighting, :music, :vibrancy, :order_speed, :service_style, :conversation, :description, images: []).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
