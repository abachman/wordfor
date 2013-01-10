require 'httparty'

require 'wordfor/core_ext/array'

require 'wordfor/version'
require 'wordfor/configuration'
require 'wordfor/setup'
require 'wordfor/plaintext'
require 'wordfor/lookup'

module Wordfor
  def self.logger
    @logger ||= Logger.new(Configuration.log_file, 1, 1024000)
  end
end
