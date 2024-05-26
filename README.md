For testing:

```bash
docker build -t arch-setup . && docker run --rm -it arch-setup bash -c 'ansible-playbook local.yml && zsh'
```
