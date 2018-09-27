ARG GO_VERSION=1.10
ARG ALPINE_VERSION=3.8
ARG PACKAGE=example.com/skaffold-spam
ARG APP=spam

FROM golang:${GO_VERSION}-alpine${ALPINE_VERSION} as builder

ARG PACKAGE
RUN mkdir -p /go/src/${PACKAGE}
WORKDIR /go/src/${PACKAGE}

COPY . ./
ARG APP
RUN go build -o /${APP}

FROM alpine:${ALPINE_VERSION} as target

ARG APP
COPY --from=builder /${APP} /
CMD [ "/${APP}" ]
