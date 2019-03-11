# generate-php-proto-interface-server

## overview
* This is php file generater using protocolbuffer interface.
* 

## how to use
### first
```
git clone https://github.com/t-o-z/generate-php-proto-interface-server.git
cd generate-php-proto-interface-server
cp your_proto_files ./proto
```

### docker run

```
docker-compose build
docker-compose up -d
```

### enter server

```
docker exec -it proto_build bash
```

### build php files.

```
cd /proto
protoc --proto_path=./  -I ~/protobuf/src --php_out=/proto/out --grpc-php_out=composer_name=grpc/interface_name:out --plugin=protoc-gen-grpc-php=./vendor/bin/protoc-gen-grpc-php ./*.proto
```