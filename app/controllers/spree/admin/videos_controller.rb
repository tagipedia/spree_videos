module Spree
  module Admin
    class VideosController < ResourceController
      before_filter :load_data
      create.before :set_product
      update.before :set_product

      def update_positions
        params[:positions].each do |id, index|
          Video.find(id).update_attributes(position: index)
        end

        respond_to do |format|
          format.js  { render :text => params }
        end
      end

      private

      def location_after_save
        admin_product_videos_url(@product)
      end

      def load_data
        @product = Product.where(slug: params[:product_id]).first
      end

      def set_product
        @video.watchable = @product
      end
    end
  end
end
