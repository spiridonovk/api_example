
class Api::V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render :index, status: 200
  end

  def create
    @category = Category.new(category_params)
    @category.products_count = 0
    if @category.save
      render :create, status: 201
    else
      render json: { errors: @category.errors }, status: 422
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
