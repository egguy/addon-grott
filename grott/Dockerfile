ARG BUILD_FROM=ghcr.io/hassio-addons/base:14.3.3
# hadolint ignore=DL3006
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install python/pip
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache \
        python3=3.11.6-r0 \
        bind-tools=9.18.19-r0 \
        && ln -sf python3 /usr/bin/python \
        && python3 -m ensurepip

# Copy data for add-on
COPY script.sh /app/script.sh
RUN chmod a+x /app/script.sh

WORKDIR /app
RUN curl -Lk 'https://github.com/johanmeijer/grott/archive/refs/heads/master.zip' --output files.zip && unzip -o files.zip && rm files.zip && mv grott-*/*.py ./

COPY requirements.txt requirements.txt
#Install required python packages
RUN pip3 install --no-cache-dir -r requirements.txt

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
