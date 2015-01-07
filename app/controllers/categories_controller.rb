class CategoriesController < ApplicationController
  load_and_authorize_resource

  before_action :set_category, only: [:show, :edit, :index]

  def index
    # @categories = Category.all
  end

  def show
    # @category = Category.find_by(slug: params[:slug])
  end

  private

  def category_params
    params.require(:category).permit(:name, :slug, :description)
  end

  def set_category
    @category = Category.find_by("slug = ?", params[:slug])
  end
end
