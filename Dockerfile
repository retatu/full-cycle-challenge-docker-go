FROM golang:1.17-alpine3.14 as builder

RUN mkdir -p /main
WORKDIR /main
COPY . .
ENV CGO_ENABLED=0
RUN GOOS=linux go build ./main.go

FROM scratch
WORKDIR /main

COPY --from=builder /main/main .

CMD ["/main/main"]