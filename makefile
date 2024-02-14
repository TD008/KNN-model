# Name of the Docker image
IMAGE_NAME := anaconda-jupyter

# Container name
CONTAINER_NAME := anaconda-jupyter-container

# Docker port mappings
PORTS := 8888:8888

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the Docker container
run:
	docker run -it -p  $(PORTS) -v ./:/workspace --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Alias for 'run'
up: run

start:
	docker start $(CONTAINER_NAME)

# Stop the Docker container
down:
	docker stop $(CONTAINER_NAME)

# Kill and remove the Docker container
kill:
	docker rm -f $(CONTAINER_NAME)

# Remove the Docker image
clean:
	docker rmi $(IMAGE_NAME)

