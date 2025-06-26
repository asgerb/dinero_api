require_relative "dinero/version"

require "zeitwerk"
loader = Zeitwerk::Loader.for_gem
loader.ignore("#{__dir__}/dinero_api.rb")
loader.setup
