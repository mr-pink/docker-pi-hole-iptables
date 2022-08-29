#!/bin/bash
echo 'Setting IPv4 rules'
nft add rule ip filter INPUT tcp dport 443 counter reject with tcp reset
nft add rule ip filter INPUT udp dport 80 counter reject
nft add rule ip filter INPUT udp dport 443 counter reject
echo 'Setting IPv6 rules'
nft add rule ip6 filter INPUT tcp dport 443 counter reject with tcp reset
nft add rule ip6 filter INPUT udp dport 80 counter reject
nft add rule ip6 filter INPUT udp dport 443 counter reject
echo 'Succes. Exit.'
