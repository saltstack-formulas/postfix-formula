postfix-iptables-iptables-chain-present-smtp-input:
  iptables.chain_present:
    - name: smtp.input

postfix-iptables-iptables-insert-smtp-iptables-tcp:
  iptables.insert:
    - name: smtp.iptables.tcp
    - table: filter
    - position: 1
    - chain: smtp.input
    - jump: ACCEPT
    - match: state
    - connstate: NEW,ESTABLISHED
    - dport: 25
    - proto: tcp
    - save: True

postfix-iptables-iptables-insert-smtp-iptables-filter:
  iptables.insert:
    - name: smtp.iptables.filter
    - table: filter
    - position: 1
    - chain: INPUT
    - jump: smtp.input
    - save: True
