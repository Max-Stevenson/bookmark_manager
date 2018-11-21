require 'sinatra'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base

	get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
  	@bookmarks = Bookmark.all
  	erb(:bookmarks)
  end

  get '/bookmarks/new' do
  	erb(:'bookmarks_new')
  end

  post '/bookmark/new' do
  	Bookmark.create(url: params['url'], title: params['title'])
  	redirect ('/bookmarks')
  end

  run! if app_file == $0
end
