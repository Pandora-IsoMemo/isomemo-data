FROM ghcr.io/pandora-isomemo/base-image:latest

RUN installPackage rmarkdown

ADD . .

RUN installPackage
