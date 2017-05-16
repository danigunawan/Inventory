require 'rails_helper'

feature "Managing Items" do
  describe "Has Items" do
    let!(:collection) { FactoryGirl.create(:collection) }
    let!(:item) { FactoryGirl.create(:item, collection: collection) }

    before(:each) { visit items_path }

    scenario "displays list of items" do
      expect(page).to have_selector('.item-record', text: item.name)
    end

    scenario "add item", js: true do
      expect(page).to have_selector('#add-form-link', text: "ADD ITEM")
      click_link('Add Item')
      fill_in('Name', with: 'Sample Item')
      fill_in('Quantity', with: 5)
      select collection.name, from: 'item_collection_id'
      click_button('Save')
      expect(page).to have_selector('.item-record', text: 'Sample Item')
    end

    scenario "show item", js: true do
      expect(page).to have_selector('.show-item')
      find(:css, 'i.fa.fa-eye').trigger('click')
      expect(page).to have_selector('.item-title', text: item.name)
    end

    scenario "edit item", js: true do
      expect(page).to have_selector('.edit-item')
      find(:css, 'i.fa.fa-pencil').trigger('click')
      fill_in('Name', with: 'Edited Item')
      click_button('Save')
      expect(page).to have_selector('.item-record', text: 'Edited Item')
    end

    scenario "delete item", js: true do
      expect(page).to have_selector('.delete-item')
      find(:css, 'i.fa.fa-ban').trigger('click')
      expect(page).not_to have_selector('.item-record', text: item.name)
    end

    scenario "search item" do
      expect(page).to have_selector('#search-query')
      fill_in('search-query', with: item.name)
      click_button('Search')
      expect(page).to have_selector('.item-record', text: item.name)
    end
  end

  describe "No Items" do
    before(:each) { visit items_path }

    scenario "it should display empty records notice" do
      expect(page).to have_selector('.empty-records', text: 'No Items')
    end
  end
end
