$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require 'transaction_desk'
require 'pry'

require 'webmock/minitest'
require 'minitest/autorun'
require 'minitest/pride'

WebMock.disable_net_connect!


Dir['./test/support/**/*.rb'].each do |file|
  require file
end

include RequestStubHelpers
