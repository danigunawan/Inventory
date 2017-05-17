class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  
  def index
    @collections = Collection.includes(:items).all
  end

  def new
    @collection = Collection.new
  end

  def show
  end

  def edit
  end

  def update
    @collection.update(collection_params)
    @collections = Collection.includes(:items).all
  end

  def destroy
    @collection.destroy
    @collections = Collection.includes(:items).all
  end

  def create
    @collection = Collection.create(collection_params)
    @collections = Collection.includes(:items).all
  end

  private
  
  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name)
  end
end
