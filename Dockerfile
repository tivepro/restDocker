FROM debian:jessie
RUN apt-get update && apt-get install -y  wget gcc libc6-dev make
RUN wget -0 redis.tar.gz http://download.redIMKDIr redis \
	&& tar -xzf redis.tar.gz -C redis --strip-components=1 \
	&& make -C redis \
	&& make -C redis install
	

