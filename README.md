# Pandoc Dockerfile

This Docker image is configured with Pandoc, enhanced TeX package installation, Node.js, and [mermaid-filter](https://github.com/raghur/mermaid-filter). It's tailored to run the [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template/) template efficiently.

## Changes in Dockerfile

The Dockerfile has been updated for a more reliable and automated installation of TeX Live. The installation process is now handled by a custom `install.sh` script, which streamlines the setup by downloading and installing TeX Live without manual intervention. Additional utilities such as `bash`, `wget`, `perl`, `fontconfig-dev`, `freetype-dev`, and `tar` have been added to the base image to support this process.

## Pull image from Docker

Fetch the latest automated build image from Docker Hub:

```bash
docker pull bosbaber/docker-panadoc-mermaid
```

## Build Docker image

Build a new image with the updated Dockerfile:

```bash
docker build -t bosbaber/docker-panadoc-mermaid:latest .
```

## Run Pandoc

Use a bash script `run-pandoc.sh` on the host to invoke Pandoc in a Docker container:

```bash
docker run -v `pwd`:/workdir -w /workdir -i -t --name pandoc-container --entrypoint "/workdir/run-pandoc.sh" bosbaber/docker-panadoc-mermaid:1.0
```


## Known Issues

1. Mermaid-filter error message resolution:

    Create a `.puppeteer.json` file in the directory you run pandoc with:

    ```json
    {
        "executablePath": "/usr/bin/chromium-browser",
        "args": ["--no-sandbox"]
    }
    ```
