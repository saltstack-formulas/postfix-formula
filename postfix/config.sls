{% from "postfix/map.jinja" import postfix with context %}
include:
  - postfix

{{ postfix.config_path }}:
  file.directory:
    - user: root
    - group: {{ postfix.root_grp }}
    - dir_mode: '0755'
    - file_mode: '0644'
    - makedirs: True

{{ postfix.config_path }}/main.cf:
  file.managed:
    - source: salt://postfix/files/main.cf
    - user: root
    - group: {{ postfix.root_grp }}
    - mode: '0644'
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
    - context:
        postfix: {{ postfix|tojson }}

{% if 'vmail' in pillar.get('postfix', '') %}
{{ postfix.config_path }}/virtual_alias_maps.cf:
  file.managed:
    - source: salt://postfix/files/virtual_alias_maps.cf
    - user: root
    - group: postfix
    - mode: '0640'
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

{{ postfix.config_path }}/virtual_mailbox_domains.cf:
  file.managed:
    - source: salt://postfix/files/virtual_mailbox_domains.cf
    - user: root
    - group: postfix
    - mode: '0640'
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

{{ postfix.config_path }}/virtual_mailbox_maps.cf:
  file.managed:
    - source: salt://postfix/files/virtual_mailbox_maps.cf
    - user: root
    - group: postfix
    - mode: '0640'
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
{% endif %}

{% if salt['pillar.get']('postfix:manage_master_config', True) %}
{% import_yaml "postfix/services.yaml" as postfix_master_services %}
{{ postfix.config_path }}/master.cf:
  file.managed:
    - source: salt://postfix/files/master.cf
    - user: root
    - group: {{ postfix.root_grp }}
    - mode: '0644'
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
    - context:
        postfix: {{ postfix|tojson }}
        postfix_master_services: {{ postfix_master_services|tojson }}
{% endif %}

{%- for domain in salt['pillar.get']('postfix:certificates', {}).keys() %}

postfix_{{ domain }}_ssl_certificate:

  file.managed:
    - name: {{ postfix.config_path }}/ssl/{{ domain }}.crt
    - makedirs: True
    - contents_pillar: postfix:certificates:{{ domain }}:public_cert
    - watch_in:
       - service: postfix

postfix_{{ domain }}_ssl_key:
  file.managed:
    - name: {{ postfix.config_path }}/ssl/{{ domain }}.key
    - mode: '0600'
    - makedirs: True
    - contents_pillar: postfix:certificates:{{ domain }}:private_key
    - watch_in:
       - service: postfix

{% endfor %}

# manage various mappings
{% for mapping, data in salt['pillar.get']('postfix:mapping', {}).items() %}
  {%- set need_postmap = False %}
  {%- set file_path = salt['pillar.get']('postfix:config:' ~ mapping) %}
  {%- if file_path.startswith('proxy:') %}
    {#- Discard the proxy:-prefix #}
    {%- set _, file_type, file_path = file_path.split(':') %}
  {%- elif ':' in file_path %}
    {%- set file_type, file_path = file_path.split(':') %}
  {%- else %}
    {%- set file_type = default_database_type %}
  {%- endif %}
  {%- if not file_path.startswith('/') %}
    {%- set file_path = postfix.config_path ~ '/' ~ file_path %}
  {%- endif %}
  {%- if file_type in ("btree", "cdb", "cidr", "dbm", "hash", "pcre", "regexp", "sdbm") %}
    {%- set need_postmap = True %}
  {%- endif %}
postfix_{{ mapping }}:
  file.managed:
    - name: {{ file_path }}
    - source: salt://postfix/files/mapping.j2
    - user: root
    - group: {{ postfix.root_grp }}
    {%- if mapping.endswith('_sasl_password_maps') %}
    - mode: '0600'
    {%- else %}
    - mode: '0644'
    {%- endif %}
    - template: jinja
    - context:
        data: {{ data|json() }}
    - require:
      - pkg: postfix
      - file: {{ postfix.config_path }}/main.cf
  {%- if need_postmap %}
  cmd.wait:
    - name: {{ postfix.xbin_prefix }}/sbin/postmap {{ file_path }}
    - cwd: /
    - watch:
      - file: {{ file_path }}
    - watch_in:
      - service: postfix
  {%- endif %}
{% endfor %}
