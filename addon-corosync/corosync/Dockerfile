ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements for add-on
RUN \
    apk add --no-cache \
        corosync-qnetd

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

# Execute run.sh script
CMD [ "/run.sh" ]
