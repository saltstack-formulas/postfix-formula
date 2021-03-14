{% from "postfix/map.jinja" import postfix with context %}

postfix-postgrey-pkg-installed-postgrey:
  pkg.installed:
    - name: {{ postfix.postgrey_pkg }}

postfix-postgrey-service-running-postgrey:
  service.running:
    - name: postgrey
    - enable: {{ salt['pillar.get']('postfix:postgrey:enable_service', True) }}
    - require:
      - pkg: postfix-postgrey-pkg-installed-postgrey
    - watch:
      - pkg: postfix-postgrey-pkg-installed-postgrey

