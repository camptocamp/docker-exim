FROM debian:stretch

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y exim4-daemon-light && \
    apt-get clean

RUN echo "dc_eximconfig_configtype='{config_type}'" > /etc/exim4/update-exim4.conf.conf && \
    echo "dc_other_hostnames=''" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_local_interfaces='0.0.0.0'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_readhost=''" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_relay_domains='*'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_minimaldns='false'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_relay_nets='0.0.0.0/0'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_smarthost='{smart_host}'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "CFILEMODE='644'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_use_split_config='false'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_hide_mailname='true'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_mailname_in_oh='true'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "dc_localdelivery='mail_spool'" >> /etc/exim4/update-exim4.conf.conf && \
    echo "REMOTE_SMTP_HELO_DATA={helo_data}" >> /etc/exim4/update-exim4.conf.conf && \
    /usr/sbin/update-exim4.conf

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN mkdir /docker-entrypoint.d
COPY /docker-entrypoint.d/* /docker-entrypoint.d/
RUN cp /etc/aliases /etc/aliases.stub

EXPOSE 25
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/exim4", "-bd", "-d-all", "-v", "-q30m"]
