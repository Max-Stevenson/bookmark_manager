require 'sinatra'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

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

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params['id'])
    redirect('/bookmarks')
  end

  patch '/bookmarks/:id' do
    Bookmark.update(id: params[:id], title: params[:title], url: params[:url])
    redirect('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:"bookmark_update")
  end

  run! if app_file == $0
end
