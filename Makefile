.PHONY: compile
PROTOC_GEN_GO := $(GOPATH)/bin/protoc-gen-go
PROTOBUF_PATH := $(shell go list -f '{{ .Dir }}' -m github.com/golang/protobuf)
GOGO_PATH := $(shell go list -f '{{ .Dir }}' -m github.com/gogo/protobuf)
VALIDATORS_PATH := $(shell go list -f '{{ .Dir }}' -m github.com/mwitkow/go-proto-validators)
# If $GOPATH/bin/protoc-gen-go does not exist, we'll run this command to install
# it.
$(PROTOC_GEN_GO):
	go get -u github.com/golang/protobuf/protoc-gen-go

dep:
	go get -u github.com/gogo/protobuf@master
	go get -u github.com/gogo/protobuf
	go get -u github.com/mwitkow/go-proto-validators

grpc-demo.pb.go: ./protoc/grpc-demo.proto | $(PROTOC_GEN_GO)
	protoc -I ./protoc \
		-I $(GOPATH)/src \
		-I $(PROTOBUF_PATH) \
		-I $(GOGO_PATH) \
		-I $(GOGO_PATH)/protobuf \
		-I $(VALIDATORS_PATH) \
		./protoc/*.proto --go_out=./protoc/,plugins=grpc:./protoc/

# This is a "phony" target - an alias for the above command, so "make compile"
# still works.
compile: grpc-demo.pb.go