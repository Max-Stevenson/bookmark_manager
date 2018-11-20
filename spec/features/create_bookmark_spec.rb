require 'pg'

feature 'Creating bookmarks' do
	scenario 'A user can add bookmarks' do
		visit('/bookmarks/new')
		fill_in('url', with: 'http://testbookmark.com')
		click_on('submit')

		expect(page).to have_content('http://testbookmark.com')
	end
end