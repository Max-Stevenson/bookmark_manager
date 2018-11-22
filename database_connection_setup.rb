require 'pg'
require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  connection = DatabaseConnection.setup('bookmark_manager_test')
else
  connection = DatabaseConnection.setup('bookmark_manager')
end