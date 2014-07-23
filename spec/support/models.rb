load File.dirname(__FILE__) + '/schema.rb'

class Person < ActiveRecord::Base
  acts_as_importable :first_name, :last_name
end
