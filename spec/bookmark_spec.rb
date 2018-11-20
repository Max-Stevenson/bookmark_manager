require 'bookmark'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.create("http://www.testbookmark.com", "Test Bookmark").first
      expect(bookmark['url']).to eq("http://www.testbookmark.com")
      expect(bookmark["title"]).to eq("Test Bookmark")
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark.create('http://testsite.com', 'A Test')
      expect(Bookmark.all).to include('http://testsite.com')
    end
  end
end
