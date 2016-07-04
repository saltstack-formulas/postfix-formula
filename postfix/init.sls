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

# manage various mappings
{% for mapping, data in salt['pillar.get']('postfix:mapping', {}).items() %}
  {%- set need_postmap = False %}
  {%- set file_path = salt['pillar.get']('postfix:config:' ~ mapping) %}
  {%- if ':' in file_path %}
    {%- set file_path = file_path.split(':')[1] %}
    {%- set need_postmap = True %}
  {%- endif %}
postfix_{{ mapping }}:
  file.managed:
    - name: {{ file_path }}
    - source: salt://postfix/files/mapping.j2
    - user: root
    - group: root
    {%- if mapping.endswith('_sasl_password_maps') %}
    - mode: 600
    {%- else %}
    - mode: 644
    {%- endif %}
    - template: jinja
    - context:
        data: {{ data|json() }}
    - require:
      - pkg: postfix
  {%- if need_postmap %}
  cmd.wait:
    - name: /usr/sbin/postmap {{ file_path }}
    - cwd: /
    - watch:
      - file: {{ file_path }}
    - watch_in:
      - service: postfix
  {%- endif %}
{% endfor %}
