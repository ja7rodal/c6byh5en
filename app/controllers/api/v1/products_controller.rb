
class Api::V1::ProductsController < ApplicationController
	
	skip_before_filter :verify_authenticity_token  

	def index
		@products = Product.all
		render json: @products
	end
	
  def create
    product = Product.new(product_params)
    if product.save
      render  status: 201, json: product
    else
      render  status: 422, json: { errors: product.errors } 
    end
  end
  
 
  private
    def product_params
      params.require(:product).permit(:name, :price)
    end
  
end