FROM docker:20.10.22-alpine3.17

ARG KITCHEN_SALT_VERSION
ARG TEST_KITCHEN_VERSION

RUN apk add --update --no-cache ruby-bundler ruby-dev make build-base gcc gpg gpg-agent \
    && gem install kitchen-salt:${KITCHEN_SALT_VERSION} test-kitchen:${TEST_KITCHEN_VERSION} kitchen-docker kitchen-inspec
