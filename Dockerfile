
FROM golang:1.21.4-alpine3.18 as build

WORKDIR /app

COPY ./main.go .

RUN go build -o main main.go


FROM scratch

WORKDIR /app

COPY --from=build /app .

CMD ["./main"]

