#
# Aliases
#

# ls(1) substitution
#
# https://the.exa.website/
# https://github.com/supercrabtree/k

alias l="ls -laGF"
alias ll="ls -laGFS" # Sort by file size

# find(1) substitution
#
# https://github.com/sharkdp/fd

#alias find="fd"

# grep(1) substitution
#
# https://github.com/BurntSushi/ripgrep
# https://docs.rs/regex/1/regex/#syntax

#alias grep="rg"

# sed(1) substitution
#
# https://github.com/chmln/sd

#alias sed="sd"

#
# tmux
#

alias mux='tmux'
alias muxls='tmux ls'
alias muxks='tmux kill-session -t'
alias muxatt='tmux att'

#
# tmux
#

alias tmux='mux'
alias muxls='tmux ls'
alias muxks='tmux kill-session -t'
alias muxatt='tmux att'

# Systemd

alias sctl='systemctl'
alias sctls='systemctl status'
alias jctl='journalctl'

#
# System
#

alias ..='cd ..'                            # ..:     Shorthand to go up one dir
alias ...='cd ../../'                       # ...:    Go back 2 directory levels
alias ....='cd ../../../'                   # ....:   Go back 3 directory levels

alias f='open -a Finder ./'                 # f:      Open the directory in Finder
alias c='clear'                             # c:      Clear the terminal
alias vim='nvim'                            # vim:    Use nvim instead
alias reload="exec $SHELL -l"               # reload: Start fresh shell with sourced changes

#
# Third party applications
#

# Buku

alias b='buku --suggest'

# Pet
# https://github.com/knqyf263/pet

alias p="pet"

# Memo
# https://github.com/mattn/memo

alias m="memo"

#
# Kubernetes
#
alias k='kubectl'


#
# Docker Related
#

alias d="docker"
alias dc="docker-compose"

#
# Docker-compose commands
#

alias dcd='docker-compose down'
alias dcdro='docker-compose down --remove-orphans'

alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcub='docker-compose up --build'
alias dcubd='docker-compose up --build -d'
alias dcb='docker-compose build'

alias dcps='docker-compose ps'

#
# Interacting with containers
#

alias de='docker exec'
alias det='docker exec -t'
alias deit='docker exec -it'
alias dei='docker exec -i'
alias da='docker attach'
alias dps='docker ps'
alias dpsa='docker ps -a'

#
# Docker networks
#

alias dn='docker network'
alias dni='docker network inspect'
alias dnls='docker network list'
alias dnc='docker network create'
alias dip="docker inspect --format '{{ .NetworkSetting.IPAddress }}'"

#
# Docker volumes
#

alias dv='docker volume'
alias dvls='docker volume ls'
alias dvrm='docker volume rm'

#
# Docker images
#

alias di='docker images'

#
# `docker service`
#

alias dsls='docker service ls'
alias dsps='docker service ps'
alias dsu='docker service update'
alias dsfu='docker service update --force'

#
# kubectl
#

alias kgpo='kubectl get pods'
