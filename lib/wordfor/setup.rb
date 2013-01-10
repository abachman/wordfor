module Wordfor
  class Setup
    def self.run_setup?
      !File.exists?(Wordfor::Configuration.config_file)
    end

    def initialize(stdin, stdout)
      @stdin = stdin
      @stdout = stdout
      @settings = {}
    end

    def run
      File.open(Wordfor::Configuration.config_file, "w") do |file|
        @stdout.puts "~/.wordfor.yml not found. Running setup"
        @stdout.puts "http://words.bighugelabs.com/ API key?"
        @settings["api_key"] = @stdin.gets.chomp
        file.write @settings.to_yaml
      end
    end
  end
end

