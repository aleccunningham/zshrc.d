#
# Aliases
#

alias l="ls -l"
alias ll="ls -la --color"

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

#
# System
#

alias ..='cd ..'                            # ..:     Shorthand to go up one dir
alias ...='cd ../../'                       # ...:    Go back 2 directory levels
alias ....='cd ../../../'                   # ....:   Go back 3 directory levels

alias c='clear'                             # c:      Clear the terminal
alias reload="exec $SHELL -l"               # reload: Start fresh shell with sourced changes

#
# Docker Related
#

alias d="docker"
alias dc="docker-compose"

#
# Docker-compose commands
#

alias dcd='docker-compose down --remove-orphans'
alias dcu='docker-compose up'
alias dcud='docker-compose up -d'
alias dcb='docker-compose build'
alias dcbu='docker-compose up --build'
alias dcbud='docker-compose up --build -dś'
alias dcps='docker-compose ps'

#
# Interacting with containers
#

alias de='docker exec'
alias deit='docker exec -it'
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
alias drmi='docker rmi $()'
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
