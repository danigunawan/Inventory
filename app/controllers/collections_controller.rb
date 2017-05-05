class CollectionsController < ApplicationController
  def index
    @collections = Collection.includes(:items).all
  end

  def new
    @collection = Collection.new
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
