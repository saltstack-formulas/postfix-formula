{% from "postfix/map.jinja" import postfix with context %}

pcre:
  pkg.installed:
    - name: {{ postfix.pcre_pkg }}
    - watch_in:
      - service: postfix
