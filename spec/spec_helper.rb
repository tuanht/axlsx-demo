require 'bundler/setup'
require 'pry-byebug'
require 'axlsx-demo'

Bundler.setup

# Configure RSpec only accept expectation syntax.
RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
