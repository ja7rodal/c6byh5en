
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

	def update
		product = Product.find(params[:id])
		if product.update(product_params)
			render  status: 200, json: product
		else
			render  status: 422, json: { errors: product.errors } 
		end
	end

	def destroy
		product = Product.find(params[:id])
		if product.destroy
			render status:204, nothing: true
		end
	end

	private
	def product_params
		params.require(:product).permit(:name, :price)
	end

end


#  def update
#    product = Product.find(params[:id])
#    if product.update(product_params)
#      render json: product, status: 200
#    else
#      render json: { errors: product.errors }, status: 422
#    end
#  end
#  
#  def destroy
#    product = Product.find(params[:id])
#    product.destroy
#    head 204
#  end