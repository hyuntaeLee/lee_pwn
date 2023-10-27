FROM ubuntu:16.04
ARG DEBIAN_FRONTEND=noninteractive

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8
ENV LC_CTYPE C.UTF-8


RUN apt update && apt install -y netcat
RUN apt install vim git gcc ssh curl tmux wget gdb sudo zsh python3 python3-dev python3-pip libffi-dev build-essential libssl-dev libc6-i386 libc6-dbg gcc-multilib make -y

RUN dpkg --add-architecture i386
RUN apt update
RUN apt install libc6:i386 -y

RUN pip3 install unicorn
RUN pip3 install keystone-engine
RUN pip3 install -U pip==20.3.4
RUN pip3 install -U pwntools
RUN pip3 install capstone ropper
RUN pip3 install ropgadget
RUN apt install libcapstone-dev -y

RUN sudo apt-get install zip unzip -y
RUN wget https://github.com/hugsy/gef/archive/refs/tags/2021.10.zip
RUN unzip 2021.10.zip
RUN echo source ~/gef-2021.10/gef.py >> ~/.gdbinit

RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:brightbox/ruby-ng
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ruby2.4
RUN gem install one_gadget

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