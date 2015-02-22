require 'spec_helper'

describe 'Testing a Django app' do
  let(:django_root) { APP_ROOT.join('spec', 'fixtures', 'django-app') }

  let(:port) { 3001 }
  describe 'running an app' do
    it 'runs the given command' do
      Dir.chdir(django_root) do
        output = polyspec p: port
        expect(output).to match /1 example, 0 failures/
      end
    end
  end
end