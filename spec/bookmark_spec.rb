require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
    	connection = PG.connect(dbname: 'bookmark_manager_test')

    	Bookmark.create("http://www.makersacademy.com")
        Bookmark.create("http://www.destroyallsoftware.com")
        Bookmark.create("http://www.google.com")

    	bookmarks = Bookmark.all

    	expect(bookmarks).to include("http://www.makersacademy.com")
    	expect(bookmarks).to include("http://www.destroyallsoftware.com")
    	expect(bookmarks).to include("http://www.google.com")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
        Bookmark.create('http://testsite.com')
        expect(Bookmark.all).to include('http://testsite.com')
    end
  end
end
