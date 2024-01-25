# Dockerfile_for_pwn_setting
---
- Updated to suit me on 01/19, 2024.
- Dockerfile for pwnable
- change apt server to kakao
- added user account
<details>
<summary>include</summary>

- tmux
- oh-my-zsh
- pwntools
- ROPgadget
- one_gadget
- seccomp_tools
  - 18.04, 20.04, 22.04
- gef
  - 16.04
- scwuaptx/Pwngdb
  - 18.04, 20.04, 22.04
- patchelf
  - 16.04, 18.04
- pwninit
  - 20.04, 22.04

</details>

```
docker build --tag {imagename}:{tagnum} .
docker run -it --rm --cap-add SYS_PTRACE --security-opt seccomp:unconfined --name 22.04 -v ${PWD}/study:/study {imagename}:{tagnum} /usr/bin/zsh
```
