FROM pandoc/latex:latest

# Install additional TeX packages such as those used by eisvogel template
RUN apk add bash
RUN apk add wget perl fontconfig-dev freetype-dev tar

COPY install.sh /tmp
RUN bash /tmp/install.sh

RUN tlmgr install csquotes mdframed needspace sourcesanspro ly1 mweights \
    sourcecodepro titling pagecolor epstopdf zref footnotebackref \
    koma-script hardwrap catchfile
RUN apk add --update ghostscript

# Install Node and mermaid-filter

ENV CHROME_BIN="/usr/bin/chromium-browser" \
    PUPPETEER_SKIP_CHROMIUM_DOWNLOAD="true"

RUN apk add --update udev ttf-freefont chromium npm \
    && npm install -g mermaid-filter@1.4.5 --unsafe-perm=true

ENTRYPOINT [ "/usr/local/bin/pandoc" ]