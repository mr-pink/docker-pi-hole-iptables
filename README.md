# docker-pi-hole-iptables
A modified version of the original pi-hole/docker-pi-hole image that allows firewall configuration via 'iptables'. The idea is to speed up slowly loading web sites which exhibit https-based ads. By blocking https-requests of blocked domains directly at the firewall, the site does not need to wait for the timeout.
