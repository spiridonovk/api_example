
class Api::V1::ProductsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @products = @category.products

    render :index, head: 200
end

  def create
    @category = Category.find(params[:category_id])
    @product = @category.products.new(product_params)
    if @product.save
      render :create, head: 201
    else
      render json: { errors: @product.errors }, head: 422
   end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    render json: nil, head: 204
     end

  def product_params
    params.require(:product).permit(:name, :price)
     end

  def incr_products_count
    @category.update_attrivute(products_count)
  end
end
