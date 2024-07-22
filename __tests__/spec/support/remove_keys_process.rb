# spec/support/remove_keys.rb
require 'yaml'
require_relative 'snapshot_helper'

def validate_payloads(snapshot_name, validation_result, keys_to_remove)
  # Load snapshot
  snapshot = load_snapshot(snapshot_name)
  
  # Convert snapshot to hash
  hashed_snapshot = eval(snapshot)

  # Convert validation result to hash
  hashed_result = validation_result.to_hash

  # Remove specified keys from both hashes
  filtered_snapshot = remove_keys(hashed_snapshot, keys_to_remove)
  filtered_result = remove_keys(hashed_result, keys_to_remove)

  return filtered_snapshot, filtered_result
end

def remove_keys(hash, keys)
  hash.each do |key, value|
    if value.is_a?(Hash)
      remove_keys(value, keys)
    elsif value.is_a?(Array)
      value.each do |item|
        remove_keys(item, keys) if item.is_a?(Hash)
      end
    end
    hash.delete(key) if keys.include?(key)
  end
end

