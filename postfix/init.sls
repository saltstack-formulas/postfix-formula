{% from "postfix/map.jinja" import postfix with context %}

postfix:
  pkg.installed:
    - name: {{ postfix.package }}
    - watch_in:
      - service: postfix
  service.running:
    - enable: {{ salt['pillar.get']('postfix:enable_service', True) }}
    - require:
      - pkg: postfix
    - watch:
      - pkg: postfix

{%- macro postmap_file(filename, mode=644) %}
{%- set file_path = '/etc/postfix/' ~ filename %}
postmap_{{ filename }}:
  file.managed:
    - name: {{ file_path }}
    - source: salt://postfix/{{ filename }}
    - user: root
    - group: root
    - mode: {{ mode }}
    - template: jinja
    - require:
      - pkg: postfix
  cmd.wait:
    - name: /usr/sbin/postmap {{ file_path }}
    - cwd: /
    - watch:
      - file: {{ file_path }}
{%- endmacro %}

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
{{ postmap_file('virtual') }}
{% endif %}

# manage /etc/postfix/relay_domains if data found in pillar
{% if 'relay_domains' in pillar.get('postfix', '') %}
{{ postmap_file('relay_domains') }}
{% endif %}

# manage /etc/postfix/sasl_passwd if data found in pillar
{% if 'sasl_passwd' in pillar.get('postfix', '') %}
{{ postmap_file('sasl_passwd', 600) }}
{% endif %}

# manage /etc/postfix/sender_canonical if data found in pillar
{% if 'sender_canonical' in pillar.get('postfix', '') %}
{{ postmap_file('sender_canonical') }}
{% endif %}
