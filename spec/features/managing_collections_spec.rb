require 'rails_helper'

feature "Managing Collections" do
  describe "has collections" do
    let!(:collection) { FactoryGirl.create(:collection) }

    before(:each) do
      visit collections_path
    end

    scenario "displays list of collections" do
      expect(page).to have_selector('.collection-record', text: collection.name)
    end

    scenario "add collection", js: true do
      expect(page).to have_selector('#add-form-link', text: "ADD COLLECTION")
      click_link('Add Collection')
      fill_in('Name', with: 'Sample Collection')
      click_button('Save')
      expect(page).to have_selector('.collection-record', text: 'Sample Collection')
    end

    scenario "show collections", js: true do
      expect(page).to have_selector('.show-collection')
      find(:css, 'i.fa.fa-eye').trigger('click')
      expect(page).to have_selector('.collection-title', text: collection.name)
    end

    scenario "edit collection", js: true do
      expect(page).to have_selector('.edit-collection')
      find(:css, 'i.fa.fa-pencil').trigger('click')
      fill_in('Name', with: 'Edited Collection')
      click_button('Save')
      expect(page).to have_selector('.collection-record', text: 'Edited Collection')
    end

    scenario "delete collection", js: true do
      expect(page).to have_selector('.delete-collection')
      find(:css, 'i.fa.fa-ban').trigger('click')
      expect(page).not_to have_selector('.collection-record', text: collection.name)
    end

    scenario "search collection" do
      expect(page).to have_selector('#search-query')
      fill_in('search-query', with: collection.name)
      click_button('Search')
      expect(page).to have_selector('.collection-record', text: collection.name)
    end
  end

  describe "has no collections" do
    before(:each) do
      visit collections_path
    end

    scenario "displays message noting no collections" do
      expect(page).to have_selector('.empty-records', text: 'No Collections')
    end
  end
end
