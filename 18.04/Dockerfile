FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8
ENV LC_CTYPE C.UTF-8

RUN apt-get update && apt-get install -y netcat

RUN apt update
RUN apt install curl git tmux wget file zsh sudo vim libssl-dev libffi-dev build-essential libssl-dev libc6-i386 libc6-dbg gcc-multilib make gcc gdb -y
RUN apt install python python-pip git curl wget vim zsh gdb python3 python3-pip  -y

RUN dpkg --add-architecture i386 &&\
       apt-get update
RUN apt-get install python3-dev ruby binutils-multiarch -y
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 ruby-full python-dev python-setuptools python-capstone socat -y
RUN gem install one_gadget 
RUN gem install seccomp-tools -v 1.5.0

RUN python3 -m pip install --upgrade pip
RUN pip3 install unicorn
RUN pip3 install keystone-engine 
RUN pip3 install ropgadget

RUN pip3 install pwntools
RUN git clone https://github.com/hugsy/gef ./gef
RUN echo source ~/gef/gef.py >> ~/.gdbinit


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
