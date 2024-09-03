class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def search
    
  end

  def index
    if params[:keyword].present?
      @shops = Shop.where('shop_name LIKE ?', "%#{params[:keyword]}%")
    else
      @shops = Shop.all
    end
  end

  def search_by_reviews
    @shops = Shop.all

    @shops = @shops.sort_by do |shop|
      diffs = []

      diffs << (shop.average_cleanliness - params[:cleanliness].to_f).abs if params[:cleanliness].present? && params[:cleanliness].to_f != 0
      diffs << (shop.average_lighting - params[:lighting].to_f).abs if params[:lighting].present? && params[:lighting].to_f != 0
      diffs << (shop.average_music - params[:music].to_f).abs if params[:music].present? && params[:music].to_f != 0
      diffs << (shop.average_space - params[:space].to_f).abs if params[:space].present? && params[:space].to_f != 0
      diffs << (shop.average_vibrancy - params[:vibrancy].to_f).abs if params[:vibrancy].present? && params[:vibrancy].to_f != 0
      diffs << (shop.average_order_speed - params[:order_speed].to_f).abs if params[:order_speed].present? && params[:order_speed].to_f != 0
      diffs << (shop.average_service_style - params[:service_style].to_f).abs if params[:service_style].present? && params[:service_style].to_f != 0
      diffs << (shop.average_conversation - params[:conversation].to_f).abs if params[:conversation].present? && params[:conversation].to_f != 0

      diffs.sum
    end

    if params[:wifi].present?
      @shops = @shops.select { |shop| shop.wifi == params[:wifi] }
    end

    if params[:price_range].present?
      @shops = @shops.select { |shop| shop.price_range == params[:price_range] }
    end

    if params[:smoking].present?
      @shops = @shops.select { |shop| shop.smoking == params[:smoking] }
    end

    render :index
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def reviews
    @shop = Shop.find(params[:id])    
  end

  def photos
    @shop = Shop.find(params[:id])
    @photos = @shop.reviews.map(&:images).flatten
  end

  def new
    @shop_review = ShopReview.new
    
  end

  def create
    @shop_review = ShopReview.new(shop_review_params)
    if @shop_review.valid?
      @shop_review.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shop = Shop.find(params[:id])
    if current_user.id != @shop.user_id
      redirect_to shop_path(@shop)
    end
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      redirect_to shop_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    if current_user.id == shop.user_id
      shop.destroy
      redirect_to root_path
    else
      redirect_to shop_path(shop.id)
    end
  end

  private
  def shop_review_params
    permitted_params = params.require(:shop_review).permit(
      :shop_name, :cuisine_type, :closed_days, :opening_hours, :address, :phone_number, :additional_info, :wifi, :smoking, :latitude, :longitude,:price_range,
      :cleanliness, :space, :lighting, :music, :vibrancy, :order_speed, :service_style, :conversation, :description, payment_methods: [],images: []
    )
    permitted_params.merge(user_id: current_user.id, payment_methods: permitted_params[:payment_methods].join(','))
  end
  
  def shop_params
    permitted_params = params.require(:shop).permit(
      :shop_name, :cuisine_type, :closed_days, :opening_hours, :address, :phone_number, :additional_info, :wifi, :smoking, :latitude, :longitude, :price_range,
      payment_methods: []
    )
    
    permitted_params.merge(user_id: current_user.id, payment_methods: permitted_params[:payment_methods].join(','))
  end
  
end
