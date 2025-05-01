FROM golang:1.22-alpine AS builder

WORKDIR /app
COPY . .

RUN go mod init temp && \
    go build -ldflags="-s -w" -o app

FROM scratch

COPY --from=builder /app/app /app

ENTRYPOINT ["/app"]