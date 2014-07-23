require 'database_cleaner'

RSpec.configure do |config|
 # Use color in STDOUT
   config.color_enabled = true

 # Use color not only in STDOUT but also in pagers and files
   config.tty = true

 # Use the specified formatter
   config.formatter = :documentation # :progress, :html, :textmate

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, :js => true) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

require 'pry'
require 'acts_as_importable'
require 'active_record'
require 'active_support/concern'
require 'smarter_csv'


ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Base.send(:include, ActsAsImportable)

require 'support/models'

