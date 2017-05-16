class CollectionsController < ApplicationController
  def index
    @collections = Collection.includes(:items).all
  end

  def new
    @collection = Collection.new
  end

  def show
    @collection = Collection.find(params[:id])
  end

  def edit
    @collection = Collection.find(params[:id])
  end

  def update
    @collection = Collection.find(params[:id])
    @collection.update(collection_params)
    @collections = Collection.includes(:items).all
  end

  def destroy
    @collection = Collection.find(params[:id])
    @collection.destroy
    @collections = Collection.includes(:items).all
  end

  def create
    @collection = Collection.create(collection_params)
    @collections = Collection.includes(:items).all
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end
