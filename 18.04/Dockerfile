FROM ubuntu:18.04

ENV PATH="${PATH}:/usr/local/lib/python3.6/dist-packages/bin" \
    LC_CTYPE=C.UTF-8 \
    TZ=Asia/Seoul \
    PYTHONIOENCODING=UTF-8 \
    LC_CTYPE=C.UTF-8

# essential packages
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y gcc git python3 python3-pip ruby ruby-full sudo tmux vim wget zsh netcat gdb binutils-multiarch libssl-dev libffi-dev build-essential libc6-i386 libc6-dbg gcc-multilib make libc6:i386 libncurses5:i386 libstdc++6:i386 python3 python3-dev python3-setuptools socat dh-autoreconf && \
    apt-get upgrade -y &&\
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

# essential python packages
RUN pip3 install --upgrade pip setuptools
RUN pip3 install unicorn keystone-engine ROPgadget capstone angr pwntools

RUN gem install one_gadget && \
    gem install seccomp-tools -v 1.5.0

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
RUN echo "LS_COLORS='rs=0:di=01;32:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=01;33:ow=01;97:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';" >> ~/.zshrc && \
    echo "export LS_COLORS" >> ~/.zshrc

RUN git clone https://github.com/dracula/zsh.git
RUN ln -s /root/zsh/dracula.zsh-theme /root/.oh-my-zsh/themes/dracula.zsh-theme

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/zsh-syntax-highlighting && \
    echo "source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions && \
    echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc && \
    echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=111'" >> ~/.zshrc

RUN echo "syntax on\\nfiletype indent plugin on\\nlet python_version_2=1\\nlet python_highlight_all=1\\nset tabstop=8\\nset softtabstop=4\\nset autoindent\nset nu" >> ~/.vimrc

RUN git clone https://github.com/pwndbg/pwndbg && \
    cd pwndbg && \
    git checkout 2023.03.19 && \
    ./setup.sh 

RUN apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/cache/* && \
    rm -rf /var/lib/log/*

RUN useradd -m -s /bin/zsh user && \
    echo 'user ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN cp -r /root/.zsh /home/user/.zsh && \
    cp /root/.zshrc /home/user/.zshrc && \
    cp -r /root/.oh-my-zsh /home/user/.oh-my-zsh && \
    cp /root/.gdbinit /home/user/.gdbinit

RUN chown -R user:user /home/user/.zsh /home/user/.zshrc /home/user/.oh-my-zsh /home/user/.gdbinit

RUN chsh -s /bin/zsh root

USER user
