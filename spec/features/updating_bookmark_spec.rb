feature 'Updating a bookmark' do
	scenario 'A user can update their bookmarks' do
		bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button('Update')
    expect(current_path).to eq("/bookmarks/#{bookmark.id}/update")

    fill_in('url', with: 'http://www.makers.co.uk')
    fill_in('title', with: 'Makers UK')
    click_button('Submit')

    expect(current_path).to eq('/bookmarks')
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Makers UK', href: 'http://www.makers.co.uk')
	end
end