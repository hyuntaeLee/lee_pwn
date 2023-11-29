FROM ubuntu:20.04

ENV TZ Asia/Seoul
ENV PYTHONENCODING UTF-8
ENV LC_CTYPE C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive

RUN sed -i 's@archive.ubuntu.com@mirror.kakao.com@g' /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt upgrade && apt update
RUN apt-get update && apt-get install -y netcat

RUN apt install git curl wget vim zsh gdb python3 python3-pip python3-dev libssl-dev libffi-dev build-essential tmux -y
RUN python3 -m pip install --upgrade pip
RUN pip3 install unicorn
RUN pip3 install keystone-engine
RUN pip3 install ROPgadget
RUN pip3 install capstone
RUN pip3 install angr
RUN python3 -m pip install --upgrade pwntools

#patchelf
RUN apt update -y && apt install patchelf -y

RUN apt-get install libcapstone-dev -y
RUN apt-get install libc6:i386 -y
RUN apt install ruby-full ruby-dev -y

RUN gem install one_gadget
RUN gem install seccomp-tools

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true

RUN mkdir -p "$HOME/.zsh"
RUN git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
RUN echo "fpath+=("$HOME/.zsh/pure")\nautoload -U promptinit; promptinit\nprompt pure" >> ~/.zshrc

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
RUN echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
RUN echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=111'" >> ~/.zshrc

RUN echo "syntax on\\nfiletype indent plugin on\\nlet python_version_2=1\\nlet python_highlight_all=1\\nset tabstop=8\\nset softtabstop=4\\nset autoindent\nset nu">>~/.vimrc

RUN git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh
