FROM archlinux/base
ENV GO111MODULE=on GOPROXY=https://goproxy.io PATH=$PATH:/root/go/bin GOPATH=/root/go 
RUN sed -i /etc/pacman.d/mirrorlist -e '1i Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch'  \
    && sed -i /etc/pacman.conf -e '$a [archlinuxcn]' \
    && sed -i /etc/pacman.conf -e '$a Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch' \
    && mkdir /root/go \
    && pacman -Syu --noconfirm \ 
    && pacman -Sy composer base php-apcu openbsd-netcat unzip palemoon i3-gaps i3status openssh zsh powerline-fonts php-grpc awesome-terminal-fonts cairo archlinux-wallpaper wget python3 git xorg-server ttf-dejavu wqy-microhei the_silver_searcher procps-ng net-tools xorg-apps xorg-xinit numlockx compton lxterminal tigervnc nitrogen rofi python3 base-devel neovim go nodejs yarn npm zsh-completions python-neovim --noconfirm \
    && setcap -r `which i3status`\
    && mkdir /root/.config \
    && rm /etc/localtime \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && git clone https://github.com/enshi363/vim.git /root/.vim && ln -s /root/.vim /root/.config/nvim \
    && git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-/root}/.zim  \
    && cd /tmp && wget https://github.com/phalcon/cphalcon/archive/4.0.x.zip && unzip 4.0.x.zip && cd cphalcon-4.0.x/ext  \
    && phpize && ./configure && make && make install \
    && cd /tmp && wget https://pecl.php.net/get/psr-0.6.1.tgz && tar xzf psr-0.6.1.tgz  &&  cd psr-0.6.1  \
    && phpize && ./configure && make && make install \
    && echo 'extension=psr.so' >>  /etc/php/php.ini \
    && echo 'extension=pdo_mysql.so' >>  /etc/php/php.ini \
    && echo 'extension=phalcon.so' >>  /etc/php/php.ini \
    && echo 'extension=grpc.so' >>  /etc/php/php.ini  \
    && chsh -s /bin/zsh

COPY config /root/.config/

COPY vnc /root/.vnc 

COPY zsh/.* /root/

CMD [ "zsh" ]
