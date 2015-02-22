module Polyspec
  class DjangoProjectRunner < TestSetupRunner
    def build
      # NOOP
    end

    def start_command
      puts "Starting on #{port}"
      "python manage.py runserver #{port}"
    end
  end
end