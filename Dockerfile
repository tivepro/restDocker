FROM debian:jessie
RUN apt-get update && apt-get install -y wget gcc libc6-dev make
RUN groupadd -r redis && useradd -r -g redis redis
RUN wget -O redis.tar.gz http://download.redis.io/releases/redis-3.0.7.tar.gz \
&& echo "e56b4b7e033ae8dbf311f9191cf6fdf3ae974d1c *redis.tar.gz" | sha1sum -c - \
&& mkdir redis \
&& tar -xzf redis.tar.gz -C redis --strip-components=1 \
&& make -C redis \
&& make -C redis install
RUN mkdir /data && chown redis:redis /data
WORKDIR /data
EXPOSE 6379
CMD [ "redis-server" ]
	

