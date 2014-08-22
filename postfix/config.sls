include:
  - postfix

/etc/postfix:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

/etc/postfix/main.cf:
  file.managed:
    - source: salt://postfix/files/main.cf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
    - defaults:
        smtpd_banner: {{ salt['pillar.get']('postfix:smtpd_banner', '$myhostname ESMTP $mail_name' )}}
        biff: {{ salt['pillar.get']('postfix:biff', "'no'" )}}

        append_dot_mydomain: {{ salt['pillar.get']('postfix:append_dot_mydomain', "'no'" )}}

        readme_directory: {{ salt['pillar.get']('postfix:readme_directory', "'no'" )}}

        smtpd_tls_cert_file: {{ salt['pillar.get']('postfix:smtpd_tls_cert_file', '/etc/ssl/certs/ssl-cert-snakeoil.pem' )}}
        smtpd_tls_key_file: {{ salt['pillar.get']('postfix:smtpd_tls_key_file', '/etc/ssl/private/ssl-cert-snakeoil.key' )}}
        smtpd_use_tls: {{ salt['pillar.get']('postfix:smtpd_use_tls', "'yes'" )}}
        smtpd_tls_session_cache_database: {{ salt['pillar.get']('postfix:smtpd_tls_session_cache_database', 'btree:${data_directory}/smtpd_scache' )}}
        smtp_tls_session_cache_database: {{ salt['pillar.get']('postfix:smtp_tls_session_cache_database', 'btree:${data_directory}/smtp_scache' )}}

        myhostname: {{ salt['pillar.get']('postfix:myhostname', grains['fqdn'] )}}
        alias_maps: {{ salt['pillar.get']('postfix:alias_maps', 'hash:/etc/aliases' )}}
        alias_database: {{ salt['pillar.get']('postfix:alias_database', 'hash:/etc/aliases' )}}
        mydestination: {{ salt['pillar.get']('postfix:mydestination', grains['fqdn'] + ', localhost.localdomain, ' + grains['domain'] )}}
        relayhost: {{ salt['pillar.get']('postfix:relayhost', '' )}}
        mynetworks: {{ salt['pillar.get']('postfix:mynetworks', '127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128' )}}
        mailbox_size_limit: {{ salt['pillar.get']('postfix:mailbox_size_limit', '0' )}}
        recipient_delimiter: {{ salt['pillar.get']('postfix:recipient_delimiter', '+' )}}
        inet_interfaces: {{ salt['pillar.get']('postfix:inet_interfaces', 'all' )}}
