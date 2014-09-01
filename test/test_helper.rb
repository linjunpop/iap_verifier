require 'minitest/autorun'
require "minitest/reporters"
require 'mocha/mini_test'
require 'webmock/minitest'
require 'vcr'

Minitest::Reporters.use!

VCR.configure do |c|
  c.cassette_library_dir = File.expand_path( '../fixtures/vcr_cassettes', __FILE__)
  c.hook_into :webmock # or :fakeweb
end
