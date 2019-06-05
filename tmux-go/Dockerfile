from alpine:edge
MAINTAINER Bruce Zhou <zhouy.vreal@gmail.com>

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk update && apk upgrade && \
	apk add --no-cache g++ gcc libgcc gnupg alpine-sdk tmux zsh curl bash openrc git ripgrep go

RUN adduser -h /home/dev -s /bin/zsh -G root -D dev

WORKDIR /home/dev
RUN chown -R dev:root /home/dev
USER dev
RUN mkdir /home/dev/go
ENV GOROOT /usr/lib/go
ENV GOPATH /home/dev/go
ENV PATH $GOPATH/bin:/usr/lib/go:$PATH
COPY --chown=dev:root tmux.conf /home/dev/.tmux.conf
COPY --chown=dev:root zshrc /home/dev/.zshrc

RUN mkdir /home/dev/.tmux && mkdir /home/dev/.tmux/plugins
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git /home/dev/.oh-my-zsh
RUN rm -rf /home/dev/.oh-my-zsh/.git
RUN git clone https://github.com/tmux-plugins/tpm.git /home/dev/.tmux/plugins/tpm
RUN rm -rf /home/dev/.tmux/plugins/tpm/.git
RUN git clone https://github.com/tmux-plugins/tmux-resurrect.git /home/dev/.tmux/plugins/tmux-resurrect
RUN rm -rf /home/dev/.tmux/plugins/tmux-resurrect/.git
RUN git clone https://github.com/tmux-plugins/tmux-continuum.git /home/dev/.tmux/plugins/tmux-continuum
RUN rm -rf /home/dev/.tmux/plugins/tmux-continuum/.git
RUN git clone https://github.com/tpope/vim-obsession.git /home/dev/.vim/bundle/vim-obsession
RUN rm -rf /home/dev/.vim/bundle/vim-obsession/.git

CMD ["tmux"]
