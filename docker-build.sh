#! /bin/bash
docker build --build-arg BUILD_FROM=homeassistant/amd64-builder:latest -t clayauld/hass-amd64-builder -f ./Dockerfile.updated .

read -r -p "Would you like to push the docker images to Dockerhub? [Y/n] " input
case $input in
      [yY][eE][sS]|[yY])
            docker push clayauld/hass-amd64-builder
            ;;
      [nN][oO]|[nN])
            break
            ;;
      *)
            docker push clayauld/hass-amd64-builder
            ;;
esac

read -r -p "Would you like to push the docker images to UnRAID Docker Registry? [Y/n] " input
case $input in
      [yY][eE][sS]|[yY])
            docker push 192.168.6.53:5000/hass-amd64-builder
            ;;
      [nN][oO]|[nN]) 
            break
            ;;
      *)
            docker push 192.168.6.53:5000/hass-amd64-builder
            ;;
esac
