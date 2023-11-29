![Docker Automated build](https://img.shields.io/docker/automated/bosbaber/docker-panadoc-mermaid)

![Docker Build Status](https://img.shields.io/docker/build/bosbaber/docker-panadoc-mermaid)

# Docker panadoc mermaid - Dockerfile

This Docker image is configured with Pandoc, enhanced TeX package installation, Node.js, and [mermaid-filter](https://github.com/raghur/mermaid-filter). It's tailored to run the [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template/) template efficiently.

This is a fork of tewarid/docker-pandoc.

## Changes in Dockerfile

The Dockerfile has been updated for a more reliable and automated installation of TeX Live. The installation process is now handled by a custom `install.sh` script, which streamlines the setup by downloading and installing TeX Live without manual intervention. Additional utilities such as `bash`, `wget`, `perl`, `fontconfig-dev`, `freetype-dev`, and `tar` have been added to the base image to support this process.

This image is very large, over 5GB. Sorry. This was a quick solution to a problem I had, and I haven't had time to optimize it yet.

## Getting started

Check out the example folder. It contains a bash script that will run the docker container and generate a pdf from the example markdown file.

```
git clone git@github.com:bosbaber/docker-panadoc-mermaid.git
cd example
bash runme.sh
```

Very important, note that the .puppeteer.json file is required to run mermaid-filter. See the Known Issues section below. Once again, much room for improvement here. Also see the contents of the example folder.

## Known Issues

1. Mermaid-filter error message resolution:

    Create a `.puppeteer.json` file in the directory you run pandoc with:

    ```json
    {
        "executablePath": "/usr/bin/chromium-browser",
        "args": ["--no-sandbox"]
    }
    ```
