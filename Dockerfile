FROM inwt/r-shiny:4.3.2

RUN echo "options(repos = c(getOption('repos'), PANDORA = 'https://Pandora-IsoMemo.github.io/drat/'))" >> /usr/local/lib/R/etc/Rprofile.site

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    pandoc \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/*

RUN rm -rf bin && installPackage rmarkdown

ADD . .

RUN installPackage
