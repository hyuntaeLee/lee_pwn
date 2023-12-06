# Dockerfile_for_pwn_setting
---
- Updated to suit me on 12/06, 2023.
- Dockerfile for pwnable
- change apt server to kakao
- include
  - tmux
  - oh-my-zsh
  - pwntools
  - ROPgadget
  - one_gadget
  - seccomp_tools
    - 18.04, 20.04, 22.04
  - pwndbg
    - 18.04, 20.04, 22.04
  - gef
    - 16.04
  - pwndbg
    - 18.04, 20.04, 22.04
  - patchelf
    - 16.04, 18.04
  - pwninit
    - 20.04, 22.04
```
docker build --tag {imagename}:{tagnum} .
docker run -it --name {version} -v $PWD/{shareddir}:/{containerdir} {imagename:tagnum} usr/bin/zsh
```
