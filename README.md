# Dockerfile_for_pwn_setting
---
- Updated to suit me on October 27, 2023.
- Dockerfile for pwnable
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
  - gef or pwndbg
  - RsaCtfTool, Binwalk, patchelf in 22.04
    - use ldd and patchelf  
```
docker build --tag {imagename}:{tagnum} .
docker run -it --name 18.04 -v $PWD/{shareddir}:/{containerdir} {imagename:tagnum} usr/bin/zsh
```
