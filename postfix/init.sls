{% from "postfix/map.jinja" import postfix with context %}

{%- if grains.os_family == "Suse" %}
# The existence of this file prevents the system to
# overwrite files from salt when installing.
postfix-init-file-managed-postfix.configured:
  file.managed:
    - name: /var/adm/postfix.configured
    - contents: ''
    - mode: '0644'
    - user: 'root'
    - group: 'root'
    - require_in:
      - pkg: postfix-init-pkg-installed-postfix
{%- endif %}

postfix-init-pkg-installed-postfix:
  pkg.installed:
    - name: {{ postfix.package }}
{%- if grains.os_family == "FreeBSD" %}
    - force: True
    - batch: True
{%- endif %}
    - watch_in:
      - service: postfix-init-service-running-postfix

postfix-init-service-running-postfix:
  service.running:
    - name: postfix
    - enable: {{ salt['pillar.get']('postfix:enable_service', True) }}
    - reload: {{ salt['pillar.get']('postfix:reload_service', True) }}
    - require:
      - pkg: postfix-init-pkg-installed-postfix
    - watch:
      - pkg: postfix-init-pkg-installed-postfix

{%- if salt['pillar.get']('postfix:reload_service', True) %}
# Restart postfix if the package was changed.
# This also provides an ID to be used in a watch_in statement.
postfix-init-service-running-postfix-restart:
  service.running:
    - name: postfix
    - watch:
      - pkg: postfix-init-pkg-installed-postfix
{%- endif %}

# manage /etc/aliases if data found in pillar
{% if 'aliases' in pillar.get('postfix', '') %}
{% if salt['pillar.get']('postfix:aliases:use_file', true) == true %}
  {%- set need_newaliases = False %}
  {%- set file_path = postfix.aliases_file %}
  {%- if ':' in file_path %}
    {%- set file_type, file_path = postfix.aliases_file.split(':') %}
  {%- else %}
    {%- set file_type = postfix.default_database_type %}
  {%- endif %}
  {%- if file_type in ("btree", "cdb", "dbm", "hash", "sdbm") %}
    {%- set need_newaliases = True %}
  {%- endif %}
postfix-init-file-managed-alias-database:
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
      - pkg: postfix-init-pkg-installed-postfix

  {%- if need_newaliases %}
postfix-init-cmd-run-new-aliases:
  cmd.run:
    - name: newaliases
    - cwd: /
    - onchanges:
      - file: {{ file_path }}
  {%- endif %}
{% else %}
  {%- for user, target in salt['pillar.get']('postfix:aliases:present', {}).items() %}
postfix-init-alias-present-{{ user }}:
  alias.present:
    - name: {{ user }}
    - target: {{ target }}
  {%- endfor %}
  {%- for user in salt['pillar.get']('postfix:aliases:absent', {}) %}
postfix-init-alias-absent-{{ user }}:
  alias.absent:
    - name: {{ user }}
  {%- endfor %}
{% endif %}
{% endif %}
