require 'rails_helper'

feature "Managing Collections" do
  describe "has collections" do
    let!(:collection) { FactoryGirl.create(:collection) }

    scenario "displays list of collections" do
      visit root_path
      expect(page).to have_selector('.collection-record', text: collection.name)
    end
  end

  describe "has no collections" do
    scenario "displays message noting no collections" do
      visit root_path
      expect(page).to have_selector('.empty-records', text: 'No Collections')
    end
  end

  scenario "add collection", js: true do
    visit root_path
    expect(page).to have_selector('#add-form-link', text: 'Add Collection')
    click_link('Add Collection')
    fill_in('Name', with: 'Sample Collection')
    click_button('Save')
    expect(page).to have_selector('.collection-record', text: 'Sample Collection')
  end

  scenario "edit collection", js: true do
    visit root_path
    expect(page).to have_selector('#edit-form-link', text: "Edit Collection")
    click_link('Edit Collection')
    fill_in('Name', with: 'Edited Collection')
    click_button('Save')
    expect(page).to have_selector('.collection-record', text: 'Edited Collection')
  end

  scenario "delete collection", js: true do
    visit root_path
    expect(page).to have_selector('#delete-form-link', text: "Delete Collection")
    click_link('Delete Collection')
    expect(page).not_to have_selector('.collection-record', text: 'Edited Collection')
  end
end
