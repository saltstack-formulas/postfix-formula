# frozen_string_literal: true

control 'Postfix config' do
  title 'config is generated correctly'

  describe postfix_conf do
    its('biff') { should cmp 'no' }
    its('compatibility_level') { should cmp '2' }
    its('append_dot_mydomain') { should cmp 'no' }
    its('readme_directory') { should cmp 'no' }
    its('smtpd_sasl_auth_enable') { should cmp 'yes' }
    its('smtpd_sasl_path') { should cmp '/var/run/dovecot/auth-client' }
    its('smtpd_sasl_type') { should cmp 'dovecot' }
    its('smtpd_sasl_security_options') { should cmp 'noanonymous' }
    its('smtpd_sasl_tls_security_options') { should cmp '$smtpd_sasl_security_options' }
    its('smtpd_tls_auth_only') { should cmp 'yes' }
    its('smtpd_use_tls') { should cmp 'yes' }
    its('smtpd_tls_loglevel') { should cmp '1' }
    its('smtpd_tls_security_level') { should cmp 'may' }
    its('smtp_tls_CApath') { should cmp '/etc/ssl/certs' }
    its('smtpd_tls_cert_file') { should cmp '/etc/postfix/ssl/server-cert.crt' }
    its('smtpd_tls_key_file') { should cmp '/etc/postfix/ssl/server-cert.key' }
    its('smtpd_tls_session_cache_database') do
      should cmp 'btree:${data_directory}/smtpd_scache'
    end
    its('smtpd_tls_mandatory_ciphers') { should cmp 'high' }
    its('tls_preempt_cipherlist') { should cmp 'yes' }
    its('smtp_tls_loglevel') { should cmp '1' }
    its('smtp_tls_security_level') { should cmp 'may' }
    its('smtp_tls_session_cache_database') do
      should cmp 'btree:${data_directory}/smtp_scache'
    end
    its('myhostname') { should cmp 'localhost' }
    its('alias_maps') { should cmp 'hash:/etc/aliases' }
    its('alias_database') { should cmp 'hash:/etc/aliases' }
    its('mydestination') { should cmp 'localhost, localhost.localdomain' }
    its('relayhost') { should cmp '' }
    its('mynetworks') { should cmp '127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128' }
    its('mailbox_size_limit') { should cmp '0' }
    its('recipient_delimiter') { should cmp '+' }
    its('inet_interfaces') { should cmp '127.0.0.1' }
    its('inet_protocols') { should cmp 'all' }
    its('message_size_limit') { should cmp '41943040' }
    its('smtpd_recipient_restrictions') do
      should cmp 'permit_mynetworks,'\
                 ' permit_sasl_authenticated,'\
                 ' reject_unauth_destination'
    end
    its('transport_maps') { should cmp 'hash:/etc/postfix/transport' }
    its('smtp_tls_policy_maps') { should cmp 'hash:/etc/postfix/tls_policy' }
    its('smtp_sasl_password_maps') { should cmp 'hash:/etc/postfix/sasl_passwd' }
    its('sender_canonical_maps') { should cmp 'hash:/etc/postfix/sender_canonical' }
    its('relay_recipient_maps') { should cmp 'hash:/etc/postfix/relay_domains' }
    its('virtual_alias_maps') { should cmp 'hash:/etc/postfix/virtual' }
    its('local_transport') { should cmp 'virtual' }
    its('local_recipient_maps') { should cmp '$virtual_mailbox_maps' }
    its('smtpd_relay_restrictions') do
      should cmp 'permit_mynetworks, '\
                 'permit_sasl_authenticated, '\
                 'reject_unauth_destination'
    end
    its('smtpd_sasl_local_domain') { should cmp '$mydomain' }
    its('smtpd_tls_session_cache_timeout') { should cmp '3600s' }
    its('relay_domains') { should cmp '$mydestination' }
    its('smtp_use_tls') { should cmp 'yes' }
    its('smtp_tls_cert_file') do
      should cmp '/etc/postfix/ssl/example.com-relay-client-cert.crt'
    end
    its('smtp_tls_key_file') do
      should cmp '/etc/postfix/ssl/example.com-relay-client-cert.key'
    end
  end
end
