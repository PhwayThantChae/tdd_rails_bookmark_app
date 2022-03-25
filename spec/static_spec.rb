# spec/static_spec.rb

require 'rails_helper'

RSpec.describe "Static content", type: :system do
    it 'shows the static text' do
        visit static_index_path
        expect(page).to have_content('Hello world')
    end
end
