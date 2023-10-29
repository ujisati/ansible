# Setup

```shell
ansible-playbook setup.yaml --ask-vault-pass --ask-become-pass
```
Don't run with sudo since this changes ~/ and ansible manages escalation.
The Dockerfile can be used for testing.
