# __tests__/spec/support/spec_helper.rb
require "json_spec"

RSpec.configure do |config|
  config.include JsonSpec::Helpers

  JsonSpec.directory = File.expand_path('../../snapshots', __FILE__)
end
