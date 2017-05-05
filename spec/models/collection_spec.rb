require 'rails_helper'

RSpec.describe Collection, type: :model do
  it { is_expected.to have_many :items }

  describe "public instance methods" do
    let(:collection) { FactoryGirl.build(:collection) }
    let!(:low_stock_item) { FactoryGirl.create(:item, :low_stock_item, collection: collection) }
    let!(:stocked_item) { FactoryGirl.create(:item, :stocked_item, collection: collection) }

    describe "#any_low_stock_items?" do
      it "checks whether there are any items low on stock" do
        expect(collection.any_low_stock_items?).to be_truthy
      end
    end

    describe "#low_stock_items" do
      it "should return all items that are low on stock" do
        expect(collection.low_stock_items.to_a).to eq([low_stock_item])
      end
    end
  end
end
