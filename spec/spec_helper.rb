require('rspec')
require('pg')
require('authors_books')
require('author')
require('patron')
require('checkout')
require('book')

DB = PG.connect({:dbname => "library_systems_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM authors *;")
    DB.exec("DELETE FROM authors_books *;")
    DB.exec("DELETE FROM books *;")
    DB.exec("DELETE FROM patrons *;")
    DB.exec("DELETE FROM checkouts *;")
  end
end
