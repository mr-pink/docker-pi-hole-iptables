# docker-pi-hole-iptables
A modified version of the original pi-hole/docker-pi-hole image that allows firewall configuration via 'iptables' or 'nftables', respectively. The idea is to speed up slowly loading web sites which exhibit https-based ads. By blocking https-requests of blocked domains directly at the firewall, the site does not need to wait for the timeout. <br>
The original 'pihole' image is developed at <https://github.com/pi-hole/docker-pi-hole>.<br>
The idea and original firewall rules ('iptables' appraoch) have been developed at <https://pi-hole.net/blog/2018/02/02/why-some-pages-load-slow-when-using-pi-hole-and-how-to-fix-it>. This original rule set comprises the following settings:
```bash
iptables -A INPUT -p tcp --dport 443 -j REJECT --reject-with tcp-reset
iptables -A INPUT -p udp --destination-port 80 -j REJECT --reject-with icmp-port-unreachable
iptables -A INPUT -p udp --destination-port 443 -j REJECT --reject-with icmp-port-unreachable
ip6tables -A INPUT -p tcp --destination-port 443 -j REJECT --reject-with tcp-reset
ip6tables -A INPUT -p udp --destination-port 80 -j REJECT --reject-with icmp6-port-unreachable
ip6tables -A INPUT -p udp --destination-port 443 -j REJECT --reject-with icmp6-port-unreachable
```
These rules can be locally persisted running the following statements:
```bash
iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6
```
The output is available in the 'legavy_rules' directory of this repository.
These rules have been translated to comply with 'nftables' using the 'iptables-translate'-command suite. The resulting commands are applied when executing the 'set_nft_rules.sh' script in the running container. Note that the container needs to be started with the '--cap-add=NET_ADMIN' option to provide sufficient rights. More details 'nftables' and the transition from 'iptables' can be found at <https://www.redhat.com/en/blog/using-iptables-nft-hybrid-linux-firewall>.<br>
