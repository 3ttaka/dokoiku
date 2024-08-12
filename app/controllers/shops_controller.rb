class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def search
    
  end

  def index
    @shops = Shop.search(params[:keyword])
  end

  def show
  end

  def new
    @shop_review = ShopReview.new
    
  end

  def create
    @shop_review = ShopReview.new(shop_params)
    if @shop_review.valid?
      @shop_review.save
      redirect_to root_path, notice: 'お店の情報とレビューが投稿されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def shop_params
    permitted_params = params.require(:shop_review).permit(
      :shop_name, :cuisine_type, :closed_days, :opening_hours, :address, :phone_number, :additional_info, :wifi, :smoking, :price_range,
      :cleanliness, :space, :lighting, :music, :vibrancy, :order_speed, :service_style, :conversation, :description, payment_methods: []
    )
    permitted_params.merge(user_id: current_user.id, payment_methods: permitted_params[:payment_methods].join(','))
  end
  
end
