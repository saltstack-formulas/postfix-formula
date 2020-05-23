# frozen_string_literal: true

control 'Postfix maps' do
  title 'maps have been generated properly'

  describe command('postmap -q example.com /etc/postfix/transport') do
    its('stdout') { should eq "10.1.1.1\n" }
    its('exit_status') { should eq 0 }
  end

  describe command('postmap -q example.com /etc/postfix/tls_policy') do
    its('stdout') { should eq "encrypt\n" }
    its('exit_status') { should eq 0 }
  end

  describe command('postmap -q .example.com /etc/postfix/tls_policy') do
    its('stdout') { should eq "encrypt\n" }
    its('exit_status') { should eq 0 }
  end
end
