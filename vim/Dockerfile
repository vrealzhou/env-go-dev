from vreal/env-tmux-go:latest
MAINTAINER Bruce Zhou <zhouy.vreal@gmail.com>

USER root

RUN apk add vim

RUN cd /home/dev && wget https://sourceforge.net/projects/ctags/files/ctags/5.8/ctags-5.8.tar.gz
RUN tar -xzf /home/dev/ctags-5.8.tar.gz
WORKDIR /home/dev/ctags-5.8
RUN cd /home/dev/ctags-5.8 && /home/dev/ctags-5.8/configure && make && make install
RUN rm -rf /home/dev/ctags-5.8

USER dev
WORKDIR /home/dev/
RUN cd /home/dev
RUN git clone https://github.com/diverdane/vim-go-ide.git /home/dev/.vim_runtime
RUN rm -rf /home/dev/.vim_runtime/.git
RUN /home/dev/.vim_runtime/install.sh

CMD ["tmux"]