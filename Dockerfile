ARG QUARTO_VERSION="1.3.340"

FROM ghcr.io/quarto-dev/quarto:${QUARTO_VERSION} AS builder

COPY . /app
WORKDIR /app

RUN quarto render .

FROM httpd:alpine

COPY --from=builder /app/_site/ /usr/local/apache2/htdocs/
