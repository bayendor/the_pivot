class Tenants::LineItemsController < ApplicationController

  def index
    @items    = Item.all
    @meats    = find_food_group('meats')
    @veggies  = find_food_group('veggies')
    @extras   = find_food_group('extras')
    @salsas   = find_food_group('salsas')
  end

  def build_item
    @item  = Item.find(params[:id])
    @items = Item.all
    @fillings = @item.fillings.active.uniq.group_by { |filling| filling.food_group }.sort.reverse
  end

  private

  def find_food_group(food_group)
    Filling.where(food_group: food_group)
  end
end
