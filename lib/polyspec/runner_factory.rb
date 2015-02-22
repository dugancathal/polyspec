require 'find'

module Polyspec
  class RunnerFactory
    attr_reader :project_path
    def initialize(project_path)
      @project_path = project_path
    end

    PROJECT_TYPE_MATCHERS = {
      DjangoProjectRunner => ->(project_files) { project_files.any? {|f| next if File.extname(f) == '.pyc'; File.read(f).match(/django/i) } },
      GolangProjectRunner => ->(project_files) { project_files.any? {|f| File.extname(f) == '.go' } },
    }

    def get
      project_files = Find.find(project_path).select {|f| File.file?(f) }
      PROJECT_TYPE_MATCHERS.find {|runner, matcher| matcher.call(project_files) }.first
    end
  end
end