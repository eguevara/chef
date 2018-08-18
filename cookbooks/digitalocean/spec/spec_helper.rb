require 'chefspec'
require 'chefspec/berkshelf'

# load our helper libraries
Dir['libraries/*.rb'].each { |f| require File.expand_path(f) }