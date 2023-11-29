# Break on error
set -e

mkdir -p results

# Creates a docker container and runs pandoc with the mermaid filter on example.md

# Demonstrates creating html
docker run -v $(pwd):/app -w /app -it --rm --name pandoc-runner --entrypoint /usr/local/bin/pandoc bosbaber/docker-panadoc-mermaid example.md -o results/readme.md.html --filter mermaid-filter

# Demonstrates creating pdf
docker run -v $(pwd):/app -w /app -it --rm --name pandoc-runner --entrypoint /usr/local/bin/pandoc bosbaber/docker-panadoc-mermaid example.md -o results/readme.md.pdf --filter mermaid-filter