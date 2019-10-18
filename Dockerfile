FROM golang:1.13-alpine as builder
LABEL maintainer="hitalos <hitalos@gmail.com>"

RUN apk -U add g++ gcc git libc-dev
WORKDIR /go/src
RUN git clone https://github.com/gohugoio/hugo.git
WORKDIR /go/src/hugo
RUN git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
RUN CGO_ENABLED=0 go install

FROM scratch
COPY --from=builder /go/bin/hugo /
WORKDIR /var/www
ENTRYPOINT ["/hugo"]
