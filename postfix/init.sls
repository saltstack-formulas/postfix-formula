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

{# Used for newaliases, postalias and postconf #}
{%- set default_database_type = salt['pillar.get']('postfix:config:default_database_type', 'hash') %}

# manage /etc/aliases if data found in pillar
{% if 'aliases' in pillar.get('postfix', '') %}
{% if salt['pillar.get']('postfix:aliases:use_file', true) == true %}
  {%- set need_newaliases = False %}
  {%- set file_path = postfix.aliases_file %}
  {%- if ':' in file_path %}
    {%- set file_type, file_path = postfix.aliases_file.split(':') %}
  {%- else %}
    {%- set file_type = default_database_type %}
  {%- endif %}
  {%- if file_type in ("btree", "cdb", "dbm", "hash", "sdbm") %}
    {%- set need_newaliases = True %}
  {%- endif %}
postfix_alias_database:
  file.managed:
    - name: {{ file_path }}
    - source: salt://postfix/aliases
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - require:
      - pkg: postfix
  {%- if need_newaliases %}
  cmd.wait:
    - name: newaliases
    - cwd: /
    - watch:
      - file: {{ file_path }}
  {%- endif %}
{% else %}
  {%- for user, target in salt['pillar.get']('postfix:aliases:present', {}).items() %}
postfix_alias_present_{{ user }}:
  alias.present:
    - name: {{ user }}
    - target: {{ target }}
  {%- endfor %}
  {%- for user in salt['pillar.get']('postfix:aliases:absent', {}) %}
postfix_alias_absent_{{ user }}:
  alias.absent:
    - name: {{ user }}
  {%- endfor %}
{% endif %}
{% endif %}

# manage various mappings
{% for mapping, data in salt['pillar.get']('postfix:mapping', {}).items() %}
  {%- set need_postmap = False %}
  {%- set file_path = salt['pillar.get']('postfix:config:' ~ mapping) %}
  {%- if ':' in file_path %}
    {%- set file_type, file_path = file_path.split(':') %}
  {%- else %}
    {%- set file_type = default_database_type %}
  {%- endif %}
  {%- if file_type in ("btree", "cdb", "dbm", "hash", "sdbm") %}
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
