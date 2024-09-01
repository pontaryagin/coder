mkdir -p ./config
docker run -it --rm --name code-server -p 127.0.0.1:8080:8080 \
  -v "./config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  --userns=keep-id \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest

# curl -L https://coder.com/install.sh | sh
# adduser tmp
# su - tmp -c 'coder server'

