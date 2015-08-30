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
{% if salt['pillar.get']('postfix:manage_master_config', True) %}
/etc/postfix/master.cf:
  file.managed:
    - source: salt://postfix/files/master.cf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
{% endif %}

{% set ssl_certs = salt['pillar.get']('postfix:ssl_certs', {}) -%}
{% for name in ssl_certs %}
/etc/ssl/private/postfix-{{ name }}.crt:
  file.managed:
    - contents: |
        {{ ssl_certs[name] | indent(8) }}
    - user: nobody
    - group: nobody
    - mode: 444
    - backup: minion
    - watch_in:
      - service: postfix
    - require:
      - pkg: postfix
{% endfor %}


{% set ssl_keys = salt['pillar.get']('postfix:ssl_keys', {}) -%}
{% for name in ssl_keys %}
/etc/ssl/private/postfix-{{ name }}.key:
  file.managed:
    - contents: |
        {{ ssl_keys[name] | indent(8) }}
    - user: nobody
    - group: nobody
    - mode: 400
    - backup: minion
    - watch_in:
      - service: postfix
    - require:
      - pkg: postfix
{% endfor %}


