# This adds the current script directory to the load path.
$:.unshift "#{File.dirname(__FILE__)}/lib"

# requires module
require 'acts_as_importable'
