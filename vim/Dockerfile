from vreal/env-tmux-go:latest
MAINTAINER Bruce Zhou <zhouy.vreal@gmail.com>

USER root

RUN apk add python3 vim openrc openssh
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd
RUN echo "dev:dev" | chpasswd

RUN cd /home/dev && wget https://sourceforge.net/projects/ctags/files/ctags/5.8/ctags-5.8.tar.gz
RUN tar -xzf /home/dev/ctags-5.8.tar.gz
RUN rm -f /home/dev/ctags-5.8.tar.gz
WORKDIR /home/dev/ctags-5.8
RUN cd /home/dev/ctags-5.8 && /home/dev/ctags-5.8/configure && make && make install
WORKDIR /home/dev/
RUN cd /home/dev
RUN rm -rf /home/dev/ctags-5.8
RUN rc-update add sshd

USER dev
RUN git clone https://github.com/diverdane/vim-go-ide.git /home/dev/.vim_runtime
RUN rm -rf /home/dev/.vim_runtime/.git
RUN /home/dev/.vim_runtime/install.sh
RUN echo "alias vi=vim" >> /home/dev/.zshrc


CMD vim -E -c GoInstallBinaries -c GoUpdateBinaries -c q ; sh