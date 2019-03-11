FROM thatsamguy/trusty-php71
# install modules
RUN pecl install grpc
RUN pecl install protobuf

# composer install
WORKDIR /root 
RUN curl -sS https://getcomposer.org/installer | php 
RUN mv composer.phar /usr/local/bin/composer

# protoc command enabled
WORKDIR /root 
RUN curl -OL https://github.com/google/protobuf/releases/download/v3.3.0/protoc-3.3.0-linux-x86_64.zip 
RUN unzip -o protoc-3.3.0-linux-x86_64.zip -d /usr/local bin/protoc 
RUN rm -f protoc-3.3.0-linux-x86_64.zip

# interface install(always want to use google timestamp...)
WORKDIR /root 
RUN git clone https://github.com/protocolbuffers/protobuf.git 
WORKDIR /root/protobuf 
RUN git submodule update --init --recursive 
RUN ./autogen.sh

# composer require
WORKDIR /proto
RUN composer require lvht/grpc
