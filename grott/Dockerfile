ARG BUILD_FROM=ghcr.io/hassio-addons/base-python:14.0.0
# hadolint ignore=DL3006
FROM $BUILD_FROM

ENV GIT_REF=36845fe1df38b7bdcdb6d02e43aecf991d67406a
ENV LANG C.UTF-8

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache \
        bind-tools=9.18.27-r0

# Copy data for add-on
COPY script.sh /app/script.sh
RUN chmod a+x /app/script.sh

WORKDIR /app
RUN curl -Lk "https://github.com/johanmeijer/grott/archive/$GIT_REF.zip" --output files.zip && unzip -o files.zip && rm files.zip && mv grott-*/*.py ./

COPY requirements.txt requirements.txt
#Install required python packages
RUN pip install --no-cache-dir -r requirements.txt

CMD [ "./script.sh" ]

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
        io.hass.name="${BUILD_NAME}" \
        io.hass.description="${BUILD_DESCRIPTION}" \
        io.hass.arch="${BUILD_ARCH}" \
        io.hass.type="addon" \
        io.hass.version=${BUILD_VERSION} \
        maintainer="egguy <etienne.guilluy@gmail.com>" \
        org.opencontainers.image.title="${BUILD_NAME}" \
        org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
        org.opencontainers.image.authors="egguy <etienne.guilluy@gmail.com>" \
        org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
        org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
        org.opencontainers.image.created=${BUILD_DATE} \
        org.opencontainers.image.revision=${BUILD_REF} \
        org.opencontainers.image.version=${BUILD_VERSION}
