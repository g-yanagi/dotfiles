ARCH=$(if [ "$(uname -m)" = "amd64" ]; then echo "amd64"; else echo "aarch64"; fi)

echo ${ARCH}

DOCKER_VERSION="20.10.11"

curl -sL https://download.docker.com/mac/static/stable/$ARCH/docker-$DOCKER_VERSION.tgz | tar xzv -C $HOME
