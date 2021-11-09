#!/bin/bash
docker run -i --rm --entrypoint=/bin/bash -v ${PWD}:/go/src/github.com/stumpy1/protobuf_test golang << COMMANDS
apt update -qqq
apt install --no-install-recommends -qqq -y protobuf-compiler
cd /go/src
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
protoc --go_out=. github.com/stumpy1/protobuf_test/proto/service.proto
cd github.com/stumpy1/protobuf_test
rm go.mod go.sum
go mod init
go mod tidy
COMMANDS