sanitise () { echo "$1" | tr '[:upper:]' '[:lower:]' | sed -E 's;[^a-z0-9_-];;g'; }

# Set the docker compose environment
COMPOSE_PROJECT_NAME=${COMPOSE_PROJECT_NAME-cloud-computer}
echo export COMPOSE_PROJECT_NAME=$COMPOSE_PROJECT_NAME

# Set the cloud computer environment
CLOUD_COMPUTER_DOMAIN_NAME=${CLOUD_COMPUTER_DOMAIN_NAME-cloud-computer.dev}
CLOUD_COMPUTER_HOST_NAME=${CLOUD_COMPUTER_HOST_NAME-$(sanitise $HOSTNAME)}
CLOUD_COMPUTER_HOST_USER=${CLOUD_COMPUTER_HOST_USER-$(sanitise $USER)}
CLOUD_COMPUTER_HOST_ID=${CLOUD_COMPUTER_HOST_ID-$CLOUD_COMPUTER_HOST_USER}
CLOUD_COMPUTER_IMAGE_NAME=${CLOUD_COMPUTER_IMAGE_NAME-cloud-computer}
CLOUD_COMPUTER_IMAGE_TAG=${CLOUD_COMPUTER_IMAGE_TAG-latest}
CLOUD_COMPUTER_REGISTRY=${CLOUD_COMPUTER_REGISTRY-cloudnativecomputer}

echo export CLOUD_COMPUTER_DOMAIN_NAME=$CLOUD_COMPUTER_DOMAIN_NAME
echo export CLOUD_COMPUTER_HOST_DNS=$CLOUD_COMPUTER_HOST_ID.$CLOUD_COMPUTER_DOMAIN_NAME
echo export CLOUD_COMPUTER_HOST_ID=$CLOUD_COMPUTER_HOST_ID
echo export CLOUD_COMPUTER_HOST_NAME=$CLOUD_COMPUTER_HOST_NAME
echo export CLOUD_COMPUTER_HOST_USER=$CLOUD_COMPUTER_HOST_USER
echo export CLOUD_COMPUTER_IMAGE=$CLOUD_COMPUTER_REGISTRY/$CLOUD_COMPUTER_IMAGE_NAME:$CLOUD_COMPUTER_IMAGE_TAG
echo export CLOUD_COMPUTER_VNC_DISPLAY=:14
echo export CLOUD_COMPUTER_XEPHYR_DISPLAY=:15

echo export CLOUD_COMPUTER_CREDENTIALS=/cloud-computer/credentials
echo export CLOUD_COMPUTER_HOME=/cloud-computer/home
echo export CLOUD_COMPUTER_NODEMON=/cloud-computer/nodemon
echo export CLOUD_COMPUTER_REPOSITORY=/cloud-computer/cloud-computer
echo export CLOUD_COMPUTER_TERRAFORM=/cloud-computer/terraform
echo export CLOUD_COMPUTER_TMUX=/cloud-computer/tmux
echo export CLOUD_COMPUTER_X11=/tmp/.X11-unix
echo export CLOUD_COMPUTER_YARN=/cloud-computer/yarn

echo export CLOUD_COMPUTER_CREDENTIALS_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_CREDENTIALS"
echo export CLOUD_COMPUTER_HOME_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_HOME"
echo export CLOUD_COMPUTER_NODEMON_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_NODEMON"
echo export CLOUD_COMPUTER_REPOSITORY_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_REPOSITORY"
echo export CLOUD_COMPUTER_TERRAFORM_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_TERRAFORM"
echo export CLOUD_COMPUTER_TMUX_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_TMUX"
echo export CLOUD_COMPUTER_X11_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_X11"
echo export CLOUD_COMPUTER_YARN_VOLUME="${COMPOSE_PROJECT_NAME}_CLOUD_COMPUTER_YARN"
