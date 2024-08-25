#!/bin/bash
# Inspired by https://github.com/ruediste/docker-sshd/blob/master/generateHostKeys.sh
rm -rf hostkeys.d
mkdir hostkeys.d
ssh-keygen -q -t rsa  -f hostkeys.d/ssh_host_rsa_key -N "" -C ""
ssh-keygen -q -t dsa  -f hostkeys.d/ssh_host_dsa_key -N "" -C ""
ssh-keygen -q -t ecdsa  -f hostkeys.d/ssh_host_ecdsa_key -N "" -C ""
ssh-keygen -q -t ed25519  -f hostkeys.d/ssh_host_ed25519_key -N "" -C ""
kubectl create secret generic ssh-host-keys --from-file=hostkeys.d/ssh_host_rsa_key --from-file=hostkeys.d/ssh_host_rsa_key.pub --from-file=hostkeys.d/ssh_host_dsa_key --from-file=hostkeys.d/ssh_host_dsa_key.pub --from-file=hostkeys.d/ssh_host_ecdsa_key --from-file=hostkeys.d/ssh_host_ecdsa_key.pub --from-file=hostkeys.d/ssh_host_ed25519_key --from-file=hostkeys.d/ssh_host_ed25519_key.pub
