{% from "postfix/map.jinja" import postfix with context %}

{%- if grains.os_family == "Suse" %}
# The existence of this file prevents the system to
# overwrite files from salt when installing.
/var/adm/postfix.configured:
  file.managed:
    - contents: ''
    - mode: '0644'
    - user: 'root'
    - group: 'root'
    - require_in:
      - pkg: postfix
{%- endif %}

postfix:
  pkg.installed:
    - name: {{ postfix.package }}
{%- if grains.os_family == "FreeBSD" %}
    - force: True
    - batch: True
{%- endif %}
    - watch_in:
      - service: postfix
  service.running:
    - enable: {{ salt['pillar.get']('postfix:enable_service', True) }}
    - reload: {{ salt['pillar.get']('postfix:reload_service', True) }}
    - require:
      - pkg: postfix
    - watch:
      - pkg: postfix

{%- if salt['pillar.get']('postfix:reload_service', True) %}
# Restart postfix if the package was changed.
# This also provides an ID to be used in a watch_in statement.
postfix_service_restart:
  service.running:
    - name: postfix
    - watch:
      - pkg: postfix
{%- endif %}

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
  {% if salt['pillar.get']('postfix:aliases:content', None) is string %}
    - contents_pillar: postfix:aliases:content
  {% else %}
    - source: salt://postfix/files/mapping.j2
  {% endif %}
    - user: root
    - group: {{ postfix.root_grp }}
    - mode: '0644'
    - template: jinja
    - context:
        data: {{ salt['pillar.get']('postfix:aliases:present') }}
        colon: True
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
