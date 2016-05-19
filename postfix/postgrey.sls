{% from "postfix/map.jinja" import postfix with context %}

postgrey:
  pkg.installed:
    - name: {{ postfix.postgrey_pkg }}
    - watch_in:
      - service: postgrey

  service.running:
    - enable: {{ salt['pillar.get']('postfix:postgrey:enable_service', True) }}
    - require:
      - pkg: postgrey
    - watch:
      - pkg: postgrey

