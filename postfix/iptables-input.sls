smtp.input:
  iptables.chain_present:
    -

smtp.iptables.tcp:
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

smtp.iptables.filter:
  iptables.insert:
    - table: filter
    - position: 1
    - chain: INPUT
    - jump: smtp.input
    - save: True

