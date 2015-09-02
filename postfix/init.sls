{% from "postfix/map.jinja" import postfix with context %}

postfix:
  pkg.installed:
    - name: {{ postfix.package }}
    - watch_in:
      - service: postfix
  service.running:
    - enable: True
    - require:
      - pkg: postfix
    - watch:
      - pkg: postfix

# manage /etc/aliases if data found in pillar
{% if 'aliases' in pillar.get('postfix', '') %}
{{ postfix.aliases_file }}:
  file.managed:
    - source: salt://postfix/aliases
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: postfix

run-newaliases:
  cmd.wait:
    - name: newaliases
    - cwd: /
    - watch:
      - file: {{ postfix.aliases_file }}
{% endif %}

# manage /etc/postfix/virtual if data found in pillar
{% if 'virtual' in pillar.get('postfix', '') %}
/etc/postfix/virtual:
  file.managed:
    - source: salt://postfix/virtual
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: postfix

run-postmap:
  cmd.wait:
    - name: /usr/sbin/postmap /etc/postfix/virtual
    - cwd: /
    - watch:
      - file: /etc/postfix/virtual
{% endif %}

# manage /etc/postfix/sasl_passwd if data found in pillar
{% if 'sasl_passwd' in pillar.get('postfix', '') %}
/etc/postfix/sasl_passwd:
  file.managed:
    - source: salt://postfix/sasl_passwd
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: postfix

  cmd.wait:
    - name: /usr/sbin/postmap /etc/postfix/sasl_passwd
    - cwd: /
    - watch:
      - file: /etc/postfix/sasl_passwd
{% endif %}

# manage /etc/postfix/sender_canonical if data found in pillar
{% if 'sender_canonical' in pillar.get('postfix', '') %}
/etc/postfix/sender_canonical:
  file.managed:
    - source: salt://postfix/sender_canonical
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: postfix

  cmd.wait:
    - name: /usr/sbin/postmap /etc/postfix/sender_canonical
    - cwd: /
    - watch:
      - file: /etc/postfix/sender_canonical
{% endif %}
