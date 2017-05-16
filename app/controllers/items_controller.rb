class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @items = Item.all
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @items = Item.all
  end

  def create
    @item = Item.create(item_params)
    @items = Item.all
  end

  private

  def item_params
    params.require(:item).permit(:name, :quantity, :collection_id)
  end
end
