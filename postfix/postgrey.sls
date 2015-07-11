{% from "postfix/map.jinja" import postfix with context %}

postgrey:
  pkg.installed:
    - name: {{ postfix.postgrey_pkg }}
    - watch_in:
      - service: postgrey

  service.running:
    - enable: True
    - require:
      - pkg: postgrey
    - watch:
      - pkg: postgrey

