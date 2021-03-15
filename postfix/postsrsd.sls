{% from "postfix/map.jinja" import postfix with context %}

postfix-postsrsd-pkg-latest-postsrsd:
  pkg.latest:
    - name: {{ postfix.postsrsd_pkg }}

