smtp.input:
  iptables.chain_present:
    -

tcp:
  iptables.insert:
    - table: filter
    - position: 1
    - chain: smtp.input
    - jump: ACCEPT
    - match: state
    - connstate: NEW,ESTABLISHED
    - dport: 25
    - proto: tcp
    - save: True

filter:
  iptables.insert:
    - table: filter
    - position: 1
    - chain: INPUT
    - jump: smtp.input
    - save: True

