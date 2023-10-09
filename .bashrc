alias docker-rm-none='docker rmi -f $(docker images --filter "dangling=true" -q --no-trunc)'
