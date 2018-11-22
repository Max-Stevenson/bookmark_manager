feature 'Adding a comment to a bookmark' do
	scenario 'A user can add a comment to a bookmark' do
		bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button('Comment')

    expect(current_path).to eq("/bookmarks/#{bookmark.id}/comments/new")

    fill_in('comment', with: 'this is a comment')
    click_button('Submit')

    expect(first('.bookmark')).to have_content('this is a comment')
	end
end