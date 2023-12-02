#!/bin/bash

echo "Running $1 version pwndocker..."

case "$1" in
	"16.04") docker run -it --rm --cap-add SYS_PTRACE --security-opt seccomp:unconfined --name 16.04 -v $PWD/study:/study leepwn:16.04 /usr/bin/zsh
	;;
	"18.04") docker run -it --rm --cap-add SYS_PTRACE --security-opt seccomp:unconfined --name 18.04 -v $PWD/study:/study leepwn:18.04 /usr/bin/zsh
	;;
	"20.04") docker run -it --rm --cap-add SYS_PTRACE --security-opt seccomp:unconfined --name 20.04 -v $PWD/study:/study leepwn:20.04 /usr/bin/zsh
	;;
	"22.04") docker run -it --rm --cap-add SYS_PTRACE --security-opt seccomp:unconfined --name 22.04 -v $PWD/study:/study leepwn:22.04 /usr/bin/zsh
	;;
esac
