from vreal/env-tmux-go:latest
MAINTAINER Bruce Zhou <zhouy.vreal@gmail.com>

USER root

RUN apk add python3 vim openssh
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
RUN echo "set nu" >> /home/dev/.vim_runtime/my_configs.vim
RUN echo "map tt :NERDTreeToggle<CR>" >> /home/dev/.vim_runtime/my_configs.vim
RUN echo "imap <C-I><C-I> <Esc>" >> /home/dev/.vim_runtime/my_configs.vim

RUN echo "alias vi=vim" >> /home/dev/.zshrc
# Install Go Binaries in vim
ENV TERM xterm-256color
RUN vim -c "execute 'silent GoUpdateBinaries' | execute 'quit'"

COPY ext-rc.vim /home/dev/ext-rc.vim
RUN cat ext-rc.vim >> /home/dev/.vimrc

ENTRYPOINT ["tmux"]
