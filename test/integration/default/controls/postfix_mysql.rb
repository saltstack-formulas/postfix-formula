# frozen_string_literal: true

control 'Postfix mysql' do
  title 'should be installed'

  describe port(25) do
    it { should be_listening }
  end
end
