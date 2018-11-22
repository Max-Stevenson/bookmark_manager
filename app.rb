require 'sinatra'
require './lib/bookmark'
require 'pg'
require 'sinatra/flash'
require_relative 'database_connection_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

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
    if Bookmark.create(url: params['url'], title: params['title'])
      redirect ('/bookmarks')
    else
      flash[:notice] = 'Invalid: URL please re-enter'
      redirect '/bookmarks/new'
    end
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

  get '/bookmarks/:id/comments/new' do
    @id = params[:id]
    erb(:"comments_new")
  end

  post '/bookmarks/comments/new' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO comments (text, bookmark_id) VALUES('#{params[:comment]}', '#{params[:id]}');")
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
