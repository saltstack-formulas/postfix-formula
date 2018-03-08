{% from "postfix/map.jinja" import postfix with context %}
include:
  - postfix

{{ postfix.config_path }}:
  file.directory:
    - user: root
    - group: {{ postfix.root_grp }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{{ postfix.config_path }}/main.cf:
  file.managed:
    - source: salt://postfix/files/main.cf
    - user: root
    - group: {{ postfix.root_grp }}
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

{% if 'vmail' in pillar.get('postfix', '') %}
{{ postfix.config_path }}/virtual_alias_maps.cf:
  file.managed:
    - source: salt://postfix/files/virtual_alias_maps.cf
    - user: root
    - group: postfix
    - mode: 640
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
    - mode: 640
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
    - mode: 640
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
{% endif %}

{% if salt['pillar.get']('postfix:manage_master_config', True) %}
{{ postfix.config_path }}/master.cf:
  file.managed:
    - source: salt://postfix/files/master.cf
    - user: root
    - group: {{ postfix.root_grp }}
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
{% endif %}

{% if 'transport' in pillar.get('postfix', '') %}
{{ postfix.config_path }}/transport:
  file.managed:
    - source: salt://postfix/files/transport
    - user: root
    - group: {{ postfix.root_grp }}
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

run-postmap:
  cmd.wait:
    - name: {{ postfix.xbin_prefix }}/sbin/postmap {{ postfix.config_path }}/transport
    - cwd: /
    - watch:
      - file: {{ postfix.config_path }}/transport
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
    - mode: 600
    - makedirs: True
    - contents_pillar: postfix:certificates:{{ domain }}:private_key
    - watch_in:
       - service: postfix

{% endfor %}
