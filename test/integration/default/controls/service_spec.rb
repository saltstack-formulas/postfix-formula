# frozen_string_literal: true

control 'Postfix service' do
  title 'should be running'

  describe service('postfix') do
    it { should be_enabled }
    it { should be_running }
  end

  describe port(25) do
    it { should be_listening }
  end
end
