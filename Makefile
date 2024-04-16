build:
	docker buildx bake  --set '*.platform=linux/amd64'

build-arm:
	docker buildx bake  --set '*.platform=linux/arm64'
