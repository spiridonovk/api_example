
class Api::V1::ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products

    render :index, status: 200
end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      render :create, status: 201
    else
      render json: { errors: @product.errors }, status: 422
   end
  end

  def destroy
    product = Product.find(params[:id])
    return  render json: { errors: 'Product not found' } unless product.present?

    product.destroy
    render json: nil, status: 204
     end

  def product_params
    params.require(:product).permit(:name, :price)
     end
  end
