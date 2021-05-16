FROM golang:1.16-alpine AS stage1
WORKDIR /go/src/app
COPY src/hello.go .
RUN go mod init hello && \
    go build && \
    go install


FROM scratch AS stage2
WORKDIR /tmp
COPY --from=stage1 /go/bin/hello .
CMD ["/tmp/hello"]

