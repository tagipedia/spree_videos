module Spree
  class VideosController < BaseController
    respond_to :html
    
    def index
      @videos = Video.all(:joins => :product, :conditions => 'spree_products.deleted_at is NULL')
    end

    def product_index
      @product = Product.find_by_slug(params[:product_id])
      @videos = @product.videos.all(:order => 'position')
    end

    def show
      video = Video.find(params[:id])
      account = Yt::Account.new
    end
  end
end
