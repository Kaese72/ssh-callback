# SSH Callback

A SSH server adapted to taking SSH connections and allowing reverse 
SSH tunnels for remote access initiated on the remote

## Resources

* https://github.com/ruediste/docker-sshd/tree/master (Inspiration)

# Setup

Generate Host keys and save them. These should not change over time. This
can be done via `generatehostkeys.sh. This will create a secret in the default space

After that add the keys you want to be able to authenticate to the SSH service to
a `authorized_keys` file and load it into a secret.

> kubectl --namespace default create secret generic ssh-keys --from-file=./authorized_keys

Once this is done, the deployment.yaml file can be deployed. Be wary of the nodeport
port assignment.
