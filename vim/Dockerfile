from vreal/env-tmux-go:latest
MAINTAINER Bruce Zhou <zhouy.vreal@gmail.com>

USER root
# openssh
RUN apk add python3 vim openssh
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd
RUN echo "dev:dev" | chpasswd
# ctags
RUN cd /home/dev && wget https://sourceforge.net/projects/ctags/files/ctags/5.8/ctags-5.8.tar.gz
RUN tar -xzf /home/dev/ctags-5.8.tar.gz
RUN rm -f /home/dev/ctags-5.8.tar.gz
WORKDIR /home/dev/ctags-5.8
RUN cd /home/dev/ctags-5.8 && /home/dev/ctags-5.8/configure && make && make install
WORKDIR /home/dev/
RUN cd /home/dev
RUN rm -rf /home/dev/ctags-5.8
RUN rc-update add sshd
#setup vim
USER dev
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY vimrc /home/dev/.vimrc
RUN echo "alias vi=vim" >> /home/dev/.zshrc
# Install Go Binaries in vim
RUN vim -c 'set nomore' +PlugInstall +qall

COPY ext-rc.vim /home/dev/ext-rc.vim
USER root
RUN chown dev:root /home/dev/.vimrc
RUN ls -la /home/dev/*
USER dev
RUN cat /home/dev/ext-rc.vim >> /home/dev/.vimrc

ENTRYPOINT ["tmux"]