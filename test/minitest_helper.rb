if ENV['COVERAGE']
  require 'simplecov'
  SimpleCov.start
end

if ENV['TRAVIS']
  require 'coveralls'
  Coveralls.wear!
end

require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/benchmark'
require 'minitest/pride'

require 'wrong/adapters/minitest'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'itsalive'
