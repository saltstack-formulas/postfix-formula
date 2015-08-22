{% from "postfix/map.jinja" import postfix with context %}

policyd_spf:
  pkg.installed:
    - name: {{ postfix.policyd_spf_pkg }}
