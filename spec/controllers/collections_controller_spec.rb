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
    it "creates a new collection for testing" do
      get :new, xhr: true
      expect(assigns(:collection).class).to eq(Collection)
      expect(assigns(:collection).new_record?).to be_truthy
    end
  end
end
