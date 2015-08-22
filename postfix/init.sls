{% from "postfix/map.jinja" import postfix with context %}

postfix:
  {% if postfix.packages is defined %}
  pkg.installed:
    - names:
  {% for name in postfix.packages %}
        - {{ name }}
  {% endfor %}
    - watch_in:
      - service: postfix
  {% endif %}
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
