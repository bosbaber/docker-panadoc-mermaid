wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz 
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-`date +%Y%m%d`
perl ./install-tl --no-interaction 