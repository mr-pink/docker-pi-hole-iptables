# The base image is the regular pihole image, version fixed
FROM pihole/pihole:2022.05

ENV DEBIAN_FRONTEND=noninteractive

# Install 'iptables' to configure firewall
RUN apt-get update &&\
    apt-get install -y iptables iptables-persistent &&\
    apt-get clean -y

# Copy bash script to later apply nft rules
COPY set_nft_rules.sh set_nft_rules.sh
RUN chmod u+x set_nft_rules.sh
