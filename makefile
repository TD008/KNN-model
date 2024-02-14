IMAGE_NAME := anaconda-jupyter

CONTAINER_NAME := anaconda-jupyter-container

PORTS := 8888:8888

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run -it -p  $(PORTS) -v ./:/workspace --name $(CONTAINER_NAME) $(IMAGE_NAME)

# Alias for 'run'
up: run

start:
	docker start $(CONTAINER_NAME)

down:
	docker stop $(CONTAINER_NAME)

kill:
	docker rm -f $(CONTAINER_NAME)

clean:
	docker rmi $(IMAGE_NAME)

