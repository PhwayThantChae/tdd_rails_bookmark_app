# spec/system/bookmark/update_spec.rb

require 'rails_helper'

RSpec.describe 'update bookmark', type: :system do
    # this will create a 'bookmark' method, before each scenario is ran
    let!(:bookmark) { Bookmark.create(url: 'https://rubyyagi.com', title: 'Ruby Yagi') }

    scenario 'empty title and url' do
        visit bookmarks_path
        click_link 'Edit', match: :first
        fill_in 'Title', with: ''
        fill_in 'Url', with: ''

        click_button 'Update Bookmark'

        # The page should show error message 'Title can't be blank'
        expect(page).to have_content("Title can't be blank")

        # The bookmark title should be unchanged
        expect(bookmark.reload.title).to eq('Ruby Yagi')
    end

    scenario 'valid title and url' do
        visit bookmarks_path
        click_link 'Edit', match: :first
        fill_in 'Title', with: 'Ruby Yagi'
        fill_in 'Url', with: 'https://rubyyagi.com'

        click_button 'Update Bookmark'

        # The page should show success message
        expect(page).to have_content("Bookmark was successfully updated")

        # The bookmark title should be changed
        expect(bookmark.reload.title).to eq('Ruby Yagi')
        expect(bookmark.reload.url).to eq('https://rubyyagi.com')
    end
end