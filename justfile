image := "jahrik/arm-gosu-tini"
tag := "latest"
platforms := "linux/amd64,linux/arm64,linux/arm/v7"

# Build the image locally
[group('build')]
build image_name=image image_tag=tag:
    docker build -t {{ image_name }}:{{ image_tag }} .

# Push the image to its default registry
[group('build')]
push image_name=image image_tag=tag:
    docker push {{ image_name }}:{{ image_tag }}

# Log in to a container registry (used by CI before release)
[group('release')]
login registry="docker.io" username="" password="":
    echo "{{ password }}" | docker login {{ registry }} -u "{{ username }}" --password-stdin

# Multi-arch build and push (used by CI release job)
[group('release')]
release tags=(image + ":" + tag):
    docker buildx build --platform {{ platforms }} -t {{ tags }} --push .
