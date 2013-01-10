if /1.8/ =~ RUBY_VERSION
  class Dir
    class << self
      def home user
        if ENV['HOME']
          home = ENV['HOME']
        else
          raise "set your $HOME environment variable or upgrade to Ruby 1.9+ :("
        end
      end
    end
  end
end
