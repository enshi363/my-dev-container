FROM archlinux/base
ENV HOME=/root
RUN sed -i /etc/pacman.d/mirrorlist -e '1i Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch'  \
    && pacman -Syu --noconfirm \ 
    && pacman -Sy i3-gaps i3status openssh zsh powerline-fonts awesome-terminal-fonts code cairo archlinux-wallpaper wget python3 git xorg-server ttf-dejavu wqy-microhei the_silver_searcher procps-ng net-tools xorg-apps xorg-xinit numlockx compton xfce4-terminal tigervnc nitrogen rofi python3 base-devel neovim go nodejs yarn npm zsh-completions python-neovim --noconfirm \
    && setcap -r `which i3status`\
    && mkdir /root/.config \
    && rm /etc/localtime \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && git clone https://github.com/enshi363/vim.git /root/.vim && ln -s /root/.vim /root/.config/nvim \
    && git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-/root}/.zim  \
    && chsh -s /bin/zsh

COPY config /root/.config/

COPY vnc /root/.vnc 

COPY zsh/.* /root/

RUN vncserver :2 #

EXPOSE 5092

CMD [ "zsh" ]