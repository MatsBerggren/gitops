REGISTRY ?= ghcr.io/MatsBerggren
IMAGE    ?= $(REGISTRY)/toolbox
TAG      ?= $(shell date +%Y%m%d-%H%M)-$$(git rev-parse --short HEAD 2>/dev/null || echo local)
PLATFORM ?= linux/amd64

build:
	docker build -f docker/Dockerfile -t $(IMAGE):$(TAG) .

dev-run: build
	kubectl run toolbox-dev --rm -it --image=$(IMAGE):$(TAG) -- bash || true

push:
	docker push $(IMAGE):$(TAG)

push-latest:
	docker tag $(IMAGE):$(TAG) $(IMAGE):latest
	docker push $(IMAGE):latest

print:
	@echo Image: $(IMAGE):$(TAG)
