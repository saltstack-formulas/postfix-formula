postfix:
  pkg:
    - installed
  service.running:
    - enable: True
    - require:
      - pkg: postfix
