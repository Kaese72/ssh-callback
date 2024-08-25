#!/bin/bash
cp /tmp/hostkeys.d/* /etc/ssh/
/usr/sbin/sshd -De
