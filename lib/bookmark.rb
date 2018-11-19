require 'pg'

class Bookmark
  def self.all
  	connection= PG.connect(dbname: 'bookmark_manager')
    query = 'SELECT * FROM bookmarks;'
    p query
    result = connection.exec(query)
    p "#{result.cmd_tuples} rows affected"
    result.map {|bookmark| bookmark['url']}
  end
end
