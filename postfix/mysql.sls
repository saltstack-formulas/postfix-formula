{% from "postfix/map.jinja" import postfix with context %}

postfix-mysql-pkg-installed-mysql:
  pkg.installed:
    - name: {{ postfix.mysql_pkg }}
    - watch_in:
      - service: postfix-init-service-running-postfix
