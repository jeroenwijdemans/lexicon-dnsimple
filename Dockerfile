FROM python:2

# Based on https://github.com/AnalogJ/lexicon/blob/master/Dockerfile

MAINTAINER jeroen

# Setup dependencies
RUN     apt-get update && \
	    apt-get -y install cron rsyslog git --no-install-recommends && \
	    rm -rf /var/lib/apt/lists/* && \
	    sed -i 's/session    required     pam_loginuid.so/#session    required     pam_loginuid.so/' /etc/pam.d/cron

# Install dehydrated (letsencrypt client) & dns-lexicon
RUN     git clone --depth 1 https://github.com/lukas2511/dehydrated.git /srv/dehydrated && \
	    pip install requests[security] dns-lexicon

VOLUME  /etc/dehydrated
VOLUME  /etc/certificates

WORKDIR     /srv/dehydrated

COPY    cmd.sh  /srv/dehydrated/cmd.sh
RUN     chmod +x /srv/dehydrated/cmd.sh

CMD ["/srv/dehydrated/cmd.sh"]
