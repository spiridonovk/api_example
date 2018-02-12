
class Api::V1::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    render :index, head: 200
  end

  def create
    @category = Category.new(category_params)
    @category.products_count = 0
    if @category.save
      render json: @category, head: 201
    else
      render json: { errors: @category.errors }, head: 422
    end
  end

  def category_params
    params.require(:category).permit(:name)
  end
end

