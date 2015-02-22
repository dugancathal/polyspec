require 'spec_helper'
require 'httparty'
require 'pathname'

describe 'Testing a Golang app' do
  let(:gopath) { APP_ROOT.join('spec', 'fixtures', 'go-app') }
  let(:test_goapp) { gopath.join('src', 'stuffs') }

  let(:port) { 3000 }
  describe 'running an app' do
    it 'runs the given command' do
      Dir.chdir(test_goapp) do
        output = polyspec p: port
        expect(output).to match /1 example, 0 failures/
      end
    end

    def environment_variables
      "GOPATH=#{gopath} PORT=#{port}"
    end
  end
end