FROM ubuntu:18.04
ENV PATH="${PATH}:/usr/local/lib/python3.6/dist-packages/bin"
ENV LC_CTYPE=C.UTF-8
ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8
ENV LC_CTYPE C.UTF-8

RUN apt update
RUN apt install -y \
    gcc \
    git \
    python3 \
    python3-pip \
    ruby \
    sudo \
    tmux \
    vim \
    wget \
    zsh \
    netcat

RUN dpkg --add-architecture i386 &&\
       apt-get update
RUN apt-get install ruby binutils-multiarch  libssl-dev libffi-dev build-essential libssl-dev libc6-i386 libc6-dbg gcc-multilib make -y
RUN apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 ruby-full python-dev python-setuptools python-capstone socat -y
RUN gem install one_gadget 

# install pwndbg
WORKDIR /root
RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /root/pwndbg
RUN git checkout 2023.03.19
RUN ./setup.sh
# install pwntools
RUN pip3 install --upgrade pip
RUN pip3 install pwntools
RUN pip3 install keystone-engine 

# install one_gadget command
RUN gem install one_gadget
# install patchelf
WORKDIR /root
RUN apt install -y dh-autoreconf
RUN git clone https://github.com/NixOS/patchelf
WORKDIR /root/patchelf
RUN git checkout 0.17.2
RUN ./bootstrap.sh
RUN ./configure
RUN make
RUN make check
RUN sudo make install
WORKDIR /

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
