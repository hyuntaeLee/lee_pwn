# pwn_docker
---
- Dockerfile for pwn
- change apt server to kakao
- include 
  - pwntools
  - ROPgadget
  - one_gadget
  - seccomp_tools
  - pwndbg
  - tmux
  - oh-my-zsh
  - pure
```
docker build --tag {imagename}:{tagnum} .
docker run -it --name 18.04 -v $PWD/{shareddir}:/{containerdir} {imagename:tagnum} usr/bin/zsh
```
