RSpec.configure do |config|
 # Use color in STDOUT
   config.color_enabled = true

 # Use color not only in STDOUT but also in pagers and files
   config.tty = true

 # Use the specified formatter
   config.formatter = :documentation # :progress, :html, :textmate

end

require 'acts_as_importable'
require 'active_record'
require 'active_support'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
# ActiveRecord::Base.send(:include, ActsAsImportable)

require 'support/models'

