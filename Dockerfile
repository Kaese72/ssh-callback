FROM ubuntu:22.04

RUN apt-get update

RUN apt-get install -y openssh-server
# Required for privilege separation
RUN mkdir /var/run/sshd
RUN rm /etc/ssh/ssh_host_*
# Copy our sshd_config file which sets up config we provide via configmaps
COPY sshd_config /etc/ssh/sshd_config
COPY entrypoint.sh /entrypoint.sh

EXPOSE 22

CMD    ["/entrypoint.sh"]
