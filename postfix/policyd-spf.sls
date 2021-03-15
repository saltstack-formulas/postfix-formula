{% from "postfix/map.jinja" import postfix with context %}

postfix-policyd-spf-pkg-installed-policyd_spf:
  pkg.installed:
    - name: {{ postfix.policyd_spf_pkg }}
