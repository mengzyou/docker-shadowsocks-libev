# This is a Dockerfile to build a opensuse image which running shadowsocks service
FROM opensuse:42.1
MAINTAINER Mengz You <mengz.you@outlook.com>

ENV VERSION 2.4.7
ENV PKG shadowsocks-libev
ENV REPO http://download.opensuse.org/repositories/home:/MargueriteSu/openSUSE_Leap_42.1/home:MargueriteSu.repo
ENV PASSWORD password
ENV CONFIG_FILE /etc/shadowsocks/shadowsocks-libev-config.json

RUN zypper -q ar -f -r $REPO \
  && zypper -qn --gpg-auto-import-keys ref \
  && zypper -qn in -l --no-recommends $PKG-$VERSION \
  && zypper clean --all

COPY shadowsocks-libev-config.json /etc/shadowsocks/
COPY entrypoint.sh /

EXPOSE 8388

# ENTRYPOINT
ENTRYPOINT ["/entrypoint.sh"]
