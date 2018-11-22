require 'database_connection'

describe DatabaseConnection do
  describe '.setup' do
    it 'sets up a connection to a database through PG' do
      expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')

      DatabaseConnection.setup('bookmark_manager_test')
    end
  end

  describe '.connection' do
  	it 'checks the status of the connection' do
  		connection = DatabaseConnection.setup('bookmark_manager_test')
  		expect(DatabaseConnection.connection).to eq connection
  	end
  end
  
  describe '.query' do
		it 'should execute SQL query' do
			DatabaseConnection.setup('bookmark_manager_test')
			DatabaseConnection.query("INSERT INTO bookmarks (title) VALUES ('test title')")
			DatabaseConnection.query("INSERT INTO bookmarks (title) VALUES ('test title 2')")
			expect(DatabaseConnection.query("SELECT COUNT (*) FROM bookmarks").getvalue(0,0).to_i).to eq(2)
		end
	end
end