#!/bin/bash

#             **WARNING**
# Many of these functions are linux specific
# and will fail on darwin due to incompatible dependencies

#
# Docker helper functions
#

# Select a running docker container to stop
function dkill() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
  del_stopped "$cid"
}

# Use fzf to enter into a given container
function dbash() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker exec -it "$cid" bash
}

# Cleanup docker containers, volumes, and images
dcleanup(){
	local containers
	mapfile -t containers < <(docker ps -aq 2>/dev/null)
	docker rm "${containers[@]}" 2>/dev/null
	local volumes
	mapfile -t volumes < <(docker ps --filter status=exited -q 2>/dev/null)
	docker rm -v "${volumes[@]}" 2>/dev/null
	local images
	mapfile -t images < <(docker images --filter dangling=true -q 2>/dev/null)
	docker rmi "${images[@]}" 2>/dev/null
}

# Remove a container given it is stopped
del_stopped() {
    local name=$1
    local state
    state=$(docker inspect --format "{{.State.Running}}" "$name" 2>/dev/null)

    if [[ "$state" == "false" ]]; then
        docker rm "$name"
    else
        echo "Container still running"
    fi
}

# Forcefully remove a container
rmctr() {
    docker rm -f $@ 2>/dev/null || true
}

# If a container relies on another, start the dependency
relies_on(){
	for container in "$@"; do
		local state
		state=$(docker inspect --format "{{.State.Running}}" "$container" 2>/dev/null)

		if [[ "$state" == "false" ]] || [[ "$state" == "" ]]; then
			echo "$container is not running, starting it for you."
			$container
		fi
	done
}

#
## Applications
#

DOCKER_REPO_PREFIX=r.alecc.dev

# Monitor container resource usage
# https://github.com/bcicen/ctop
ctop() {
    	docker run --rm -ti \
		--name ctop \
		-v /var/run/docker.sock:/var/run/docker.sock \
  	  	quay.io/vektorlab/ctop:latest
}

# Generate basic auth for nginx or apache
# https://httpd.apache.org/docs/2.4/programs/htpasswd.html
htpasswd() {
	docker run --rm -it \
		--net none \
		--name htpasswd \
		--log-driver none \
		${DOCKER_REPO_PREFIX}/htpasswd "$@"
}

# https://github.com/jakubroztocil/httpie
http() {
	docker run -t --rm \
		--net host \
		${DOCKER_REPO_PREFIX}/httpie "$@"
}

# https://github.com/timvisee/ffsend
ffsend() {
  	docker run --rm -it \
    		-v $(pwd):/data \
    		timvisee/ffsend "$@"
}

# https://github.com/donnemartin/gitsome
gitsome() {
	docker run --rm -it \
    		--name gitsome \
   		-v $(pwd):/src/ \
		-v "${HOME}/.gitsomeconfig:/root/.gitsomeconfig" \
		-v "${HOME}/.gitconfig:/home/anon/.gitsomeconfigurl" \
		mariolet/gitsome
}

# Networking utility which reads and writes data across network connections
# http://netcat.sourceforge.net/
netcat() {
	docker run --rm -it \
		--net host \
		${DOCKER_REPO_PREFIX}/netcat "$@"
}

# iftop
iftop() {
	docker run --rm -it \
		--net host \
		${DOCKER_REPO_PREFIX}/iftop "$@"
}

# iproute2
# http://lartc.org/howto/lartc.iproute2.tour.html
ip() {
	docker run -it --rm \
		--net=host \
		${DOCKER_REPO_PREFIX}/iproute2 "$@"
}

# Shellcheck
# https://github.com/koalaman/shellcheck
shellcheck() {
    	docker run \
        	-v $(pwd):/mnt \
        	${DOCKER_REPO_PREFIX}/shellcheck "$@"
}
