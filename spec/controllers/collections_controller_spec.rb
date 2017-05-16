require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
  describe "GET index" do
    before(:each) { get :index }

    it "renders the index page" do
      expect(response).to render_template(:index)
    end

    it "gets all the collections" do
      expect(assigns(:collections).to_a).to eql(Collection.all.to_a)
    end
  end

  describe "GET new" do
    it "returns a new collection for creating" do
      get :new, xhr: true
      expect(assigns(:collection).class).to eq(Collection)
      expect(assigns(:collection).new_record?).to be_truthy
    end
  end

  describe "GET show" do
    let!(:collection) { FactoryGirl.create(:collection) }

    it "returns selected collection for showing" do
      get :show, params: {id: collection.id}
      expect(assigns(:collection).class).to eq(Collection)
      expect(assigns(:collection).id).to eq(collection.id)
    end
  end

  describe "GET edit" do
    let!(:collection) { FactoryGirl.create(:collection) }

    it "returns an existing collection for editing" do
      get :edit, xhr: true, params: {id: collection.id}
      expect(assigns(:collection).class).to eq(Collection)
    end
  end

  describe "PUT update" do
    it "updates an existing collection" do
      get :new, xhr: true
      expect(assigns(:collection).class).to eq(Collection)
    end
  end

  describe "DELETE destroy" do
    let!(:collection) { FactoryGirl.create(:collection) }

    it "destroys a collection" do
      delete :destroy, xhr: true, params: {id: collection.id}
      expect(assigns(:collection).class).to eq(Collection)
      expect(Collection.exists?(assigns(:collection).id)).to be_falsey
    end
  end
end
