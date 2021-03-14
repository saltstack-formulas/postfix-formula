{% from "postfix/map.jinja" import postfix with context %}

postfix-pcre-pkg-installed-pcre:
  pkg.installed:
    - name: {{ postfix.pcre_pkg }}
    - watch_in:
      - service: postfix-init-service-running-postfix
