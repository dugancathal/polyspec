require 'fileutils'

module Polyspec
  class GolangProjectRunner < TestSetupRunner
    TMP_FILE_PATTERN = "/tmp/polyspec-app-%s"
    def build_command
      "go build -o #{binary_file} #{package_name}"
    end

    def start_command
      binary_file
    end

    def cleanup
      FileUtils.rm(binary_file)
    end

    private

    def runtime_hash
      @runtime_hash ||= Time.now.to_i
    end

    def package_name
      Dir.pwd.split('src/').last
    end

    def binary_file
      TMP_FILE_PATTERN % runtime_hash
    end
  end
end