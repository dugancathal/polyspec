require 'httparty'

module Polyspec
  class TestSetupRunner
    attr_accessor :build_command, :start_command, :stop_command, :wait_check, :wait_tries, :pid, :port, :check_url
    DEFAULT_WAIT_TRIES = 3
    DEFAULT_WAIT_CHECK = ->(port, check_url) {
      begin
        HTTParty.get("http://localhost:#{port}#{check_url}")
      rescue
      end
    }

    def self.from_args(args)
      runner = new

      runner.build_command = options[:build_command]
      runner.start_command = options[:start_command]
      runner.stop_command = options[:stop_command]
      runner.wait_tries = options[:wait_tries]
      runner.port = options[:port]
      runner.check_url = options[:check_url]
      runner
    end

    def build
      `#{build_command}`
    end

    def start
      self.pid = Process.spawn(start_command, pgroup: true)
      wait_for_app_to_boot
      pid
    end

    def stop
      if stop_command
        `#{stop_command}`
      else
        Process.kill(-9, pid)
      end
    end

    def cleanup
      # NOOP
    end

    def wait_tries
      @wait_tries || DEFAULT_WAIT_TRIES
    end

    def wait_check
      @wait_check || DEFAULT_WAIT_CHECK
    end

    private

    def wait_for_app_to_boot
      1.upto(wait_tries) do
        return if wait_check.call(port, check_url)
        sleep 0.5
      end
      raise 'Unable to start the app'
    end
  end
end