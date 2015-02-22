module Polyspec
  class CliOptionParser
    attr_reader :args
    def initialize(args_array)
      @args = args_array.dup
    end

    def parse
      options = {}
      OptionParser.new(args) do |opts|
        opts.banner = "Usage: #$0 [options]"

        opts.on("-e", "--start-command COMMAND", "The command used to start the app") do |e|
          options[:start_command] = e
        end

        opts.on("-p", "--port PORT", Integer, "The port the app will be running on", "Defaults to 3000") do |p|
          options[:port] = p
        end

        opts.on("-s", "--stop-command COMMAND", "The command used to stop the app", "If this is empty, the pid will be used to kill it") do |s|
          options[:stop_command] = s
        end

        opts.on("-b", "--build-command COMMAND", "The command used to build/setup the app") do |b|
          options[:build_command] = b
        end

        opts.on("-c", "--check-path COMMAND", "The command used to check that the app is running", "This assumes that it can perform a GET", "to 'http://localhost:$PORT/$CHECK_PATH'") do |b|
          options[:build_command] = b
        end

        opts.on("-t", "--wait-tries NUM", Integer, "The number of times to try hitting the check-url before it gives up") do |t|
          options[:wait_tries] = t
        end
      end.parse!
      options
    end
  end
end