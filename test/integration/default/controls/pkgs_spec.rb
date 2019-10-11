# frozen_string_literal: true

control 'Postfix packages' do
  title 'should be installed'

  describe package('postfix') do
    it { should be_installed }
  end
end
