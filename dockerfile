#STAGE1
FROM golang:1.15-alpine AS build

WORKDIR /go/src/app

COPY desafio.go .

RUN go build -ldflags '-s -w' desafio.go

#STAGE2

FROM scratch

COPY --from=build /go/src/app .

CMD [ "./desafio" ]