require 'pg'

feature 'Valdate bookmark URLs' do
	scenario 'user cannot submit invalid url' do
		visit('/bookmarks/new')
		fill_in('url', with: 'this is not a valid URL')
		fill_in('title', with: 'A Test Bookmark')
		click_on('submit')

		expect(page).to have_content('Invalid: URL please re-enter')
	end
end
