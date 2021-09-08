# frozen_string_literal: true

require 'test/miniracer/version'

module Test
  module Miniracer
    # raise Test::Miniracer::Error, 'Sample message'
    class Error < StandardError; end

    # Your code goes here...
  end
end

if ENV['KLUE_DEBUG']&.to_s&.downcase == 'true'
  namespace = 'Test::Miniracer::Version'
  file_path = $LOADED_FEATURES.find { |f| f.include?('test/miniracer/version') }
  version = Test::Miniracer::VERSION.ljust(9)
  puts "#{namespace.ljust(35)} : #{version.ljust(9)} : #{file_path}"
end
