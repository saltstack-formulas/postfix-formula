# frozen_string_literal: true

control 'Postfix map types' do
  title 'maps types are generated properly'

  # CIDR
  describe command('postmap -q "192.168.0.0/16" /etc/postfix/check_cidr') do
    its('stdout') { should eq "REJECT\n" }
    its('exit_status') { should eq 0 }
  end

  # PCRE
  describe command(
    'postmap -q "/^(?!owner-)(.*)-outgoing@(.*)/" /etc/postfix/check_pcre'
  ) do
    its('stdout') { should eq "550 Use ${1}@${2} instead\n" }
    its('exit_status') { should eq 0 }
  end

  # REGEXP
  describe command('postmap -q "/[%!@].*[%!@]/" /etc/postfix/check_client_access') do
    its('stdout') { should eq "550 Sender-specified routing rejected\n" }
    its('exit_status') { should eq 0 }
  end
end
