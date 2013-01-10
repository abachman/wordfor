require 'etc'

module Wordfor
  class Configuration
    class << self
      def method_missing(method)
        config[method.to_s]
      end

      def config
        @config ||= YAML.load(File.open(config_file))
      end

      def config_file
        user = Etc.getlogin
        File.join(Dir.home(user), ".wordfor.yml")
      end

      def log_file
        user = Etc.getlogin
        File.join(Dir.home(user), ".wordfor.log")
      end
    end
  end
end
