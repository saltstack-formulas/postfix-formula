# -*- coding: utf-8 -*-
# vim: ft=yaml
---
postfix:
  manage_master_config: true
  master_config:
    # Preferred way of managing services/processes. This allows for finegrained
    # control over each service. See postfix/services.yaml for defaults that can
    # be overridden.
    services:
      smtp:
        # Limit to no more than 10 smtp processes
        maxproc: 10
      # Disable oldstyle TLS wrapped SMTP
      smtps:
        enable: false
      # Enable submission service on port 587/tcp with custom options
      submission:
        enable: true
        args:
          - "-o smtpd_tls_security_level=encrypt"
          - "-o smtpd_sasl_auth_enable=yes"
          - "-o smtpd_client_restrictions=permit_sasl_authenticated,reject"
      tlsproxy:
        enable: true
        chroot: true

    # Backwards compatible definition of dovecot delivery in master.cf
    enable_dovecot: false
    # Backwards compatible definition of submission listener in master.cf
    enable_submission: false

  enable_service: true
  reload_service: true

  config:
    smtpd_banner: $myhostname ESMTP $mail_name
    smtp_tls_CApath: /etc/ssl/certs
    biff: 'no'
    append_dot_mydomain: 'no'
    readme_directory: 'no'
    myhostname: localhost
    mydestination: localhost, localhost.localdomain
    relayhost: ''
    mynetworks: 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
    mailbox_size_limit: 0
    recipient_delimiter: +
    # using all has problems in centos with ipv6
    inet_interfaces: 127.0.0.1
    inet_protocols: all

    # Alias
    alias_maps: hash:/etc/aliases
    # This is the list of files for the newaliases
    # cmd to process (see postconf(5) for details).
    # Only local hash/btree/dbm files:
    alias_database: hash:/etc/aliases

    local_transport: virtual
    local_recipient_maps: $virtual_mailbox_maps
    transport_maps: hash:/etc/postfix/transport

    # SMTP server
    smtpd_tls_session_cache_database: btree:${data_directory}/smtpd_scache
    smtpd_use_tls: 'yes'
    smtpd_sasl_auth_enable: 'yes'
    smtpd_sasl_type: dovecot
    smtpd_sasl_path: /var/run/dovecot/auth-client
    smtpd_recipient_restrictions: >-
      permit_mynetworks,
      permit_sasl_authenticated,
      reject_unauth_destination
    smtpd_relay_restrictions: >-
      permit_mynetworks,
      permit_sasl_authenticated,
      reject_unauth_destination
    smtpd_sasl_security_options: noanonymous
    smtpd_sasl_tls_security_options: $smtpd_sasl_security_options
    smtpd_tls_auth_only: 'yes'
    smtpd_sasl_local_domain: $mydomain
    smtpd_tls_loglevel: 1
    smtpd_tls_session_cache_timeout: 3600s

    relay_domains: '$mydestination'

    # SMTP server certificate and key (from pillar data)
    smtpd_tls_cert_file: /etc/postfix/ssl/server-cert.crt
    smtpd_tls_key_file: /etc/postfix/ssl/server-cert.key

    # SMTP client
    smtp_tls_session_cache_database: btree:${data_directory}/smtp_scache
    smtp_use_tls: 'yes'
    smtp_tls_cert_file: /etc/postfix/ssl/example.com-relay-client-cert.crt
    smtp_tls_key_file: /etc/postfix/ssl/example.com-relay-client-cert.key
    smtp_tls_policy_maps: hash:/etc/postfix/tls_policy

    smtp_sasl_password_maps: hash:/etc/postfix/sasl_passwd
    sender_canonical_maps: hash:/etc/postfix/sender_canonical
    relay_recipient_maps: hash:/etc/postfix/relay_domains
    virtual_alias_maps: hash:/etc/postfix/virtual

  aliases:
    # manage single aliases
    # this uses the aliases file defined in the minion config, /etc/aliases by default
    use_file: false
    present:
      root: info@example.com
    absent:
      - root

  certificates:
    server-cert:
      public_cert: |
        -----BEGIN CERTIFICATE-----
        (Your primary SSL certificate: smtp.example.com.crt)
        -----END CERTIFICATE-----
        -----BEGIN CERTIFICATE-----
        (Your intermediate certificate: example-ca.crt)
        -----END CERTIFICATE-----
        -----BEGIN CERTIFICATE-----
        (Your root certificate: trusted-root.crt)
        -----END CERTIFICATE-----
      private_key: |
        -----BEGIN RSA PRIVATE KEY-----
        (Your Private key)
        -----END RSA PRIVATE KEY-----

    example.com-relay-client-cert:
      public_cert: |
        -----BEGIN CERTIFICATE-----
        (Your primary SSL certificate: smtp.example.com.crt)
        -----END CERTIFICATE-----
      private_key: |
        -----BEGIN RSA PRIVATE KEY-----
        (Your Private key)
        -----END RSA PRIVATE KEY-----

  mapping:
    transport_maps:
      - example.com: '10.1.1.1'

    smtp_tls_policy_maps:
      - example.com: encrypt
      - .example.com: encrypt

    smtp_sasl_password_maps:
      - smtp.example.com: myaccount:somepassword

    sender_canonical_maps:
      - root: servers@example.com
      - nagios: alerts@example.com

    relay_recipient_maps:
      - example.com: OK

    virtual_alias_maps:
      - groupaliasexample:
          - someuser_1@example.com
          - someuser_2@example.com
      - singlealiasexample: someuser_3@example.com
