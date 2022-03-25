# spec/system/bookmark/create_spec.rb

require 'rails_helper'

RSpec.describe 'create bookmark', type: :system do
    scenario 'empty title and url' do
        visit new_bookmark_path
        click_button 'Create Bookmark'

        # This page should show error message 'Title can't be blank'
        # 'page' is a special variable from capybara, which contain information of the current displayed page

        expect(page).to have_content('Title can\'t be blank')

        # No bookmark record is created
        expect(Bookmark.count).to eq(0)
    end

    scenario 'valid title and url' do
        visit new_bookmark_path
        # fill in text fields with specified string
        fill_in 'Title', with: 'Google'
        fill_in 'Url', with: 'https://www.google.com'
        click_button 'Create Bookmark'

        # The page should show success message
        expect(page).to have_content("Bookmark was successfully created")

        # 1 new bookmark record is created
        expect(Bookmark.count).to eq(1)

        # Optionally, you can check the latest record data
        expect(Bookmark.last.title).to eq('Google')
    end
end