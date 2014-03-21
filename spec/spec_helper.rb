require 'rspec'
require 'pg'
require 'expense'

DB = PG.connect({:dbname => 'expense'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM expenses *;")
  end
end
