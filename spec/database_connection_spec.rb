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
end