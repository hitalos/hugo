FROM golang as builder
LABEL maintainer="hitalos <hitalos@gmail.com>"

RUN go get github.com/magefile/mage
RUN go get -d github.com/gohugoio/hugo
WORKDIR /go/src/github.com/gohugoio/hugo
RUN git checkout $(git describe --tags $(git rev-list --tags --max-count=1))
ENV CGO_ENABLED 0
RUN mage vendor && mage install
RUN apt-get update && apt-get install -q -y upx && upx /go/bin/hugo

FROM scratch
COPY --from=builder /go/bin/hugo /
WORKDIR /var/www
ENTRYPOINT ["/hugo"]
