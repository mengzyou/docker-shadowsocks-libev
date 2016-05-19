# This is a Dockerfile to build a opensuse image which running shadowsocks service
FROM mengzyou/docker-opensuse-base:42.1
MAINTAINER Mengz You <mengz.you@outlook.com>

ENV VERSION 2.4.5
ENV PKG shadowsocks-libev
ENV REPO http://download.opensuse.org/repositories/home:/MargueriteSu/openSUSE_Leap_42.1/home:MargueriteSu.repo
ENV PORT 8388
ENV PASSWORD password
ENV CONFIG_FILE /etc/shadowsocks/shadowsocks-libev-config.json
ENV SSSERVER /usr/bin/ss-server

# Add repo for the latest mariadb
RUN zypper -q ar -f -r $REPO \
  && zypper -qn --gpg-auto-import-keys ref \
  && zypper -qn in -l --no-recommends $PKG-$VERSION \
  && zypper clean --all
 
ADD shadowsocks-libev-config.json $CONFIG_FILE

COPY entrypoint.sh /

EXPOSE $PORT

# ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
