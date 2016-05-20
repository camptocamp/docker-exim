FROM debian:jessie

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
		apt-get install -y exim4-daemon-light && \
		apt-get clean

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN mkdir /docker-entrypoint.d
COPY /docker-entrypoint.d/* /docker-entrypoint.d/
RUN cp /etc/aliases /etc/aliases.stub

EXPOSE 25
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/exim4", "-bd", "-d-all", "-v", "-q30m"] 
