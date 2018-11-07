TMUX_VER=vreal/env-tmux-go:`date '+%Y%m%d%H'`
VIM_VER=vreal/env-go-dev:`date '+%Y%m%d%H'`

build-tmux:
	docker rmi vreal/env-tmux-go || exit 0
	docker build -t vreal/env-tmux-go -f tmux-go/Dockerfile tmux-go/
	docker push vreal/env-tmux-go:latest
	docker tag vreal/env-tmux-go:latest $(TMUX_VER)
	docker push $(TMUX_VER)
	docker rmi $(TMUX_VER)

build-vim:
	docker rmi vreal/env-go-dev  || exit 0
	docker build --console true -t vreal/env-go-dev -f vim/Dockerfile vim/
	#docker push vreal/env-go-dev :latest
	#docker tag vreal/env-go-dev :latest $(TMUX_VER)
	#docker push $(TMUX_VER)
	#docker rmi $(TMUX_VER)

start:
	docker run --name ide --rm -it -v $(GOPATH):/home/dev/go -v ~/projects:/home/dev/projects vreal/env-go-dev
