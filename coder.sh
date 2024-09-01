export CODER_DATA=./coder/.config/
export DOCKER_GROUP=$(getent group docker | cut -d: -f3)
mkdir -p $CODER_DATA
podman run --rm -it \
  -v $CODER_DATA:/home/coder/.config \
  -v /run/user/$(id -u)/podman/podman.sock:/var/run/docker.sock \
  --userns=keep-id \
  --group-add $DOCKER_GROUP \
  ghcr.io/coder/coder:latest
