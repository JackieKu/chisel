FROM golang:alpine AS build-env
RUN apk update && apk add --no-cache git
ENV CGO_ENABLED 0
RUN go get -v -ldflags "-w -s" github.com/JackieKu/chisel

FROM scratch
COPY --from=build-env /go/bin/chisel /chisel
ENTRYPOINT ["/chisel"]
