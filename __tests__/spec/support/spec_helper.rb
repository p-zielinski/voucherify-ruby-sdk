# __tests__/spec/support/spec_helper.rb
require "json_spec"

RSpec.configure do |config|
  config.include JsonSpec::Helpers
  JsonSpec.exclude_keys "created_at", "updated_at", "date", "related_object_parent_id", "holder_id", "id", "campaign_id", "campaign"
  JsonSpec.directory = File.expand_path('../../snapshots', __FILE__)
end

def deep_transform_keys(object, &block)
  case object
  when Array
    object.map { |e| deep_transform_keys(e, &block) }
  when Hash
    object.each_with_object({}) do |(key, value), result|
      result[yield(key)] = deep_transform_keys(value, &block)
    end
  else
    object
  end
end