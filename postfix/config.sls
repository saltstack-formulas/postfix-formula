include:
  - postfix

{% from "postfix/map.jinja" import postfix with context %}

{{ postfix.config_dir }}:
  file.directory:
    - user: {{ postfix.root_user }}
    - group: {{ postfix.root_group }}
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True

{{ postfix.config_dir }}/main.cf:
  file.managed:
    - source: salt://postfix/files/main.cf
    - user: {{ postfix.root_user }}
    - group: {{ postfix.root_group }}
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

{% if 'vmail' in pillar.get('postfix', '') %}
{{ postfix.config_dir }}/virtual_alias_maps.cf:
  file.managed:
    - source: salt://postfix/files/virtual_alias_maps.cf
    - user: {{ postfix.root_user }}
    - group: postfix
    - mode: 640
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

{{ postfix.config_dir }}/virtual_mailbox_domains.cf:
  file.managed:
    - source: salt://postfix/files/virtual_mailbox_domains.cf
    - user: {{ postfix.root_user }}
    - group: postfix
    - mode: 640
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

{{ postfix.config_dir }}/virtual_mailbox_maps.cf:
  file.managed:
    - source: salt://postfix/files/virtual_mailbox_maps.cf
    - user: {{ postfix.root_user }}
    - group: postfix
    - mode: 640
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
{% endif %}

{% if salt['pillar.get']('postfix:manage_master_config', True) %}
{{ postfix.config_dir }}/master.cf:
  file.managed:
    - source: salt://postfix/files/master.cf
    - user: {{ postfix.root_user }}
    - group: {{ postfix.root_group }}
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja
{% endif %}

{% if 'transport' in pillar.get('postfix', '') %}
{{ postfix.config_dir }}/transport:
  file.managed:
    - source: salt://postfix/files/transport
    - user: {{ postfix.root_user }}
    - group: {{ postfix.root_group }}
    - mode: 644
    - require:
      - pkg: postfix
    - watch_in:
      - service: postfix
    - template: jinja

run-postmap:
  cmd.wait:
    - name: /usr/sbin/postmap {{ postfix.config_dir }}/transport
    - cwd: /
    - watch:
      - file: {{ postfix.config_dir }}/transport
{% endif %}

{%- for domain in salt['pillar.get']('postfix:certificates', {}).keys() %}

postfix_{{ domain }}_ssl_certificate:

  file.managed:
    - name: {{ postfix.config_dir }}/ssl/{{ domain }}.crt
    - makedirs: True
    - contents_pillar: postfix:certificates:{{ domain }}:public_cert
    - watch_in:
       - service: postfix

postfix_{{ domain }}_ssl_key:
  file.managed:
    - name: {{ postfix.config_dir }}/ssl/{{ domain }}.key
    - mode: 600
    - makedirs: True
    - contents_pillar: postfix:certificates:{{ domain }}:private_key
    - watch_in:
       - service: postfix

{% endfor %}
