{% from "postfix/map.jinja" import postfix with context %}

postsrsd:
  pkg.latest:
    - name: {{ postfix.postsrsd_pkg }}

