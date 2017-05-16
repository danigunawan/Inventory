require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  describe "GET index" do
    before(:each) { get :index }

    it "renders the index page" do
      expect(response).to render_template(:index)
    end

    it "gets all items" do
      expect(assigns(:items).to_a).to eq(Item.all.to_a)
    end
  end
end
