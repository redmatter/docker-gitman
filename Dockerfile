FROM python:3.6

ARG GITMAN_VERSION=1.4

RUN ( \
    set -eux; \
    pip install gitman==${GITMAN_VERSION} --no-cache-dir; \
)
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

CMD [ "gitman" ]

LABEL \
    org.label-schema.schema-version=1.0 \
    org.label-schema.version=${GITMAN_VERSION} \
    org.label-schema.name="redmatter/gitman" \
    org.label-schema.license="MIT License" \
    org.label-schema.url="https://redmatter.com/" \
    org.label-schema.vcs-url="https://github.com/redmatter/docker-gitman" \
