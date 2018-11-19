require 'sinatra'

class BookmarkManager < Sinatra::Base

	get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do 
  	@bookmarks = [
  		"http://www.makersacademy.com",
			"http://www.destroyallsoftware.com",
			"http://www.google.com"
  	]

  	erb(:bookmarks)
  end

  run! if app_file == $0
end