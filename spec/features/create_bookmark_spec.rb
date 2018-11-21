require 'pg'

feature 'Creating bookmarks' do
	scenario 'A user can add bookmarks' do
		visit('/bookmarks/new')
		fill_in('url', with: 'http://testbookmark.com')
		fill_in('title', with: 'A Test Bookmark')
		click_on('submit')

		expect(page).to have_content('A Test Bookmark')
		expect(page).to have_link(nil, href: 'http://testbookmark.com')
	end
end