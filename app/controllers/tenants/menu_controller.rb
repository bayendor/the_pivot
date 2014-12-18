class Tenants::MenuController < ApplicationController

  def show
    @filling = Filling.find(params[:id])
  end

  def new
    @item = Item.new
    @all_fillings = Filling.all
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "The product was deleted."
  end

  def index
    @items    = Item.all
    @meats    = find_food_group('meats')
    @veggies  = find_food_group('veggies')
    @extras   = find_food_group('extras')
    @salsas   = find_food_group('salsas')
  end

  def build_temp
    @item = Item.find(params[:id])
  end

  private

  def find_food_group(food_group)
    Filling.where(food_group: food_group)
  end

  def item_params
    params.require(:item).permit(:name, :price, :filling_ids)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
