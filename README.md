# Polyspec

Test all your web-apps with Ruby and RSpec.

The motivation for this was two-fold. I wanted a) a way to write
clear, understandable tests for Golang HTTP APIs, and b) to write
capybara tests for Django apps. This provides both in a nice,
neat little package.

So far, there are default configurations for the
following languages/frameworks:

* Golang
* Django

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'polyspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install polyspec

## Usage

In it's simplest incarnation, all you need to do is run the binary:

    $ polyspec

If you have one of the configured app types, polyspec will just look
in your APP_ROOT/spec directory and run all the files matching the pattern
`spec/**/*_spec.rb`.

If you stray from the the default configuration, you need to specify some
cli arguments. From the CLI help:

    Usage: /Users/ttaylor/.rbenv/versions/2.1.4/bin/polyspec [options]
    -e, --start-command COMMAND      The command used to start the app
    -p, --port PORT                  The port the app will be running on
                                     Defaults to 3000
    -s, --stop-command COMMAND       The command used to stop the app
                                     If this is empty, the pid will be used to kill it
    -b, --build-command COMMAND      The command used to build/setup the app
    -c, --check-path COMMAND         The command used to check that the app is running
                                     This assumes that it can perform a GET
                                     to 'http://localhost:$PORT/$CHECK_PATH'
    -t, --wait-tries NUM             The number of times to try hitting the check-url before it gives up

Probably the most interesting one is the check-path. The CLI expects
to be able to hit your app on the port you give (or 3000) at this path.

The rest of the options are run verbatim by the runner, with only a
few notable things:

* The build command is run once, you can use this to specify a build step
  (like `make` or `go build`) or maybe even DB migrations
  (`rake db:migrate` anyone?)

* The start and stop commands are run before and after each test (respectively).
  This ensures you have clean state in your app.

## Contributing

1. Fork it ( https://github.com/dugancathal/polyspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write some tests
4. Write some code
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create a new Pull Request

### Testing

The full test suite requires both golang and python to be installed.
On a Mac, you can just do (presuming you have homebrew installed):

    brew install go
    brew install python
    pip install django # (or whichever installer you choose to use)
